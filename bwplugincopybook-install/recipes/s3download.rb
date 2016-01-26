#
# Cookbook Name:: bwplugincopybook-install
# Recipe:: s3download
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

# Recipe to download the installable binary file from S3
#

bwplugincopybook_bin_target_path = node['bwplugincopybook-install']['install']['bwplugincopybook_bin_target_path']
bwplugincopybook_bin_zip = node['bwplugincopybook-install']['install']['bwplugincopybook_bin_zip']
bwplugincopybook_bin_target = "#{bwplugincopybook_bin_target_path}/#{bwplugincopybook_bin_zip}"
bwplugincopybook_bin_source = node['bwplugincopybook-install']['install']['bwplugincopybook_bin_source']
tibco_universalinstaller_bin = node['bwplugincopybook-install']['install']['tibco_universalinstaller_bin']

install_group = node['bwplugincopybook-install']['install']['group']
install_user = node['bwplugincopybook-install']['install']['user']

# create the required directories
directory bwplugincopybook_bin_target_path do
  owner install_user
  group install_group
  mode '0777'
end

# Download the file from S3
remote_file bwplugincopybook_bin_target do
  source bwplugincopybook_bin_source
  owner install_user
  group install_group
  mode '0777'
end

# Install the unzip package
package 'unzip'

# Unzip the binary zip file
execute 'unzip_bin_zip' do
  command "unzip #{bwplugincopybook_bin_target}"
  cwd bwplugincopybook_bin_target_path
  not_if { File.exist? "#{bwplugincopybook_bin_target_path}/#{tibco_universalinstaller_bin}" }
end

# Change the ownership of the binary
file "#{bwplugincopybook_bin_target_path}/#{tibco_universalinstaller_bin}" do
  mode '0755'
end

# Change the permission of all the installation files. This is to copy the downloaded missing assembly file to the assembly directory
execute 'chmod-install-directories' do
  command "chmod -R 777 #{bwplugincopybook_bin_target_path}"
  user 'root'
  action :run
end
