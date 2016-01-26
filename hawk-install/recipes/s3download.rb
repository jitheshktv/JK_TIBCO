#
# Cookbook Name:: hawk-install
# Recipe:: s3download
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

# Recipe to download the installable binary file from S3
#

hawk_bin_target_path = node['hawk-install']['install']['hawk_bin_target_path']
hawk_bin_zip = node['hawk-install']['install']['hawk_bin_zip']
hawk_bin_target = "#{hawk_bin_target_path}/#{hawk_bin_zip}"
hawk_bin_source = node['hawk-install']['install']['hawk_bin_source']
tibco_universalinstaller_bin = node['hawk-install']['install']['tibco_universalinstaller_bin']

install_group = node['hawk-install']['install']['group']
install_user = node['hawk-install']['install']['user']

# create the required directories
directory hawk_bin_target_path do
  owner install_user
  group install_group
  mode '0777'
end

# Download the file from S3
remote_file hawk_bin_target do
  source hawk_bin_source
  owner install_user
  group install_group
  mode '0777'
end

# Install the unzip package
package 'unzip'

# Unzip the binary zip file
execute 'unzip_bin_zip' do
  command "unzip #{hawk_bin_target}"
  cwd hawk_bin_target_path
  not_if { File.exist? "#{hawk_bin_target_path}/#{tibco_universalinstaller_bin}" }
end

# Change the ownership of the binary
file "#{hawk_bin_target_path}/#{tibco_universalinstaller_bin}" do
  mode '0755'
end

# Change the permission of all the installation files. This is to copy the downloaded missing assembly file to the assembly directory
execute 'chmod-install-directories' do
  command "chmod -R 777 #{hawk_bin_target_path}"
  user 'root'
  action :run
end
