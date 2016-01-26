#
# Cookbook Name:: bwpluginrestjson-install
# Recipe:: s3download
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

# Recipe to download the installable binary file from S3
#

bwpluginrestjson_bin_target_path = node['bwpluginrestjson-install']['install']['bwpluginrestjson_bin_target_path']
bwpluginrestjson_bin_zip = node['bwpluginrestjson-install']['install']['bwpluginrestjson_bin_zip']
bwpluginrestjson_bin_target = "#{bwpluginrestjson_bin_target_path}/#{bwpluginrestjson_bin_zip}"
bwpluginrestjson_bin_source = node['bwpluginrestjson-install']['install']['bwpluginrestjson_bin_source']
tibco_universalinstaller_bin = node['bwpluginrestjson-install']['install']['tibco_universalinstaller_bin']

install_group = node['bwpluginrestjson-install']['install']['group']
install_user = node['bwpluginrestjson-install']['install']['user']

# create the required directories
directory bwpluginrestjson_bin_target_path do
  owner install_user
  group install_group
  mode '0777'
end

# Download the file from S3
remote_file bwpluginrestjson_bin_target do
  source bwpluginrestjson_bin_source
  owner install_user
  group install_group
  mode '0777'
end

# Install the unzip package
package 'unzip'

# Unzip the binary zip file
execute 'unzip_bin_zip' do
  command "unzip #{bwpluginrestjson_bin_target}"
  cwd bwpluginrestjson_bin_target_path
  not_if { File.exist? "#{bwpluginrestjson_bin_target_path}/#{tibco_universalinstaller_bin}" }
end

# Change the ownership of the binary
file "#{bwpluginrestjson_bin_target_path}/#{tibco_universalinstaller_bin}" do
  mode '0755'
end

# Change the permission of all the installation files. This is to copy the downloaded missing assembly file to the assembly directory
execute 'chmod-install-directories' do
  command "chmod -R 777 #{bwpluginrestjson_bin_target_path}"
  user 'root'
  action :run
end
