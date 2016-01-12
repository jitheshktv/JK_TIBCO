#
# Cookbook Name:: tra-install
# Recipe:: s3download
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

# Recipe to download the installable binary file from S3
#

tra_bin_target_path = node['tra-install']['install']['tra_bin_target_path']
tra_bin_zip = node['tra-install']['install']['tra_bin_zip']
tra_bin_target = "#{tra_bin_target_path}/#{tra_bin_zip}"
tra_bin_source = node['tra-install']['install']['tra_bin_source']
tibco_universalinstaller_bin = node['tra-install']['install']['tibco_universalinstaller_bin']

install_group = node['tra-install']['install']['group']
install_user = node['tra-install']['install']['user']

# create the required directories
directory tra_bin_target_path do
  owner install_user
  group install_group
  mode '0777'
end

# Download the file from S3
remote_file tra_bin_target do
  source tra_bin_source
  owner install_user
  group install_group
  mode '0777'
end

# Install the unzip package
package 'unzip'

# Unzip the binary zip file
execute 'unzip_bin_zip' do
  command "unzip #{tra_bin_target}"
  cwd tra_bin_target_path
  not_if { File.exist? "#{tra_bin_target_path}/#{tibco_universalinstaller_bin}" }
end

# Change the ownership of the binary
file "#{tra_bin_target_path}/#{tibco_universalinstaller_bin}" do
  mode '0755'
end
