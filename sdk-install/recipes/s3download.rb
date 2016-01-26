#
# Cookbook Name:: sdk-install
# Recipe:: s3download
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

# Recipe to download the installable binary file from S3
#

sdk_bin_target_path = node['sdk-install']['install']['sdk_bin_target_path']
sdk_bin_zip = node['sdk-install']['install']['sdk_bin_zip']
sdk_bin_target = "#{sdk_bin_target_path}/#{sdk_bin_zip}"
sdk_bin_source = node['sdk-install']['install']['sdk_bin_source']
tibco_universalinstaller_bin = node['sdk-install']['install']['tibco_universalinstaller_bin']

install_group = node['sdk-install']['install']['group']
install_user = node['sdk-install']['install']['user']

# create the required directories
directory sdk_bin_target_path do
  owner install_user
  group install_group
  mode '0777'
end

# Download the file from S3
remote_file sdk_bin_target do
  source sdk_bin_source
  owner install_user
  group install_group
  mode '0777'
end

# Install the unzip package
package 'unzip'

# Unzip the binary zip file
execute 'unzip_bin_zip' do
  command "unzip #{sdk_bin_target}"
  cwd sdk_bin_target_path
  not_if { File.exist? "#{sdk_bin_target_path}/#{tibco_universalinstaller_bin}" }
end

# Change the ownership of the binary
file "#{sdk_bin_target_path}/#{tibco_universalinstaller_bin}" do
  mode '0755'
end

# Change the permission of all the installation files. This is to copy the downloaded missing assembly file to the assembly directory
execute 'chmod-install-directories' do
  command "chmod -R 777 #{sdk_bin_target_path}"
  user 'root'
  action :run
end
