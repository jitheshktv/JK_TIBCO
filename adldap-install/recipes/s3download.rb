#
# Cookbook Name:: adldap-install
# Recipe:: s3download
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

# Recipe to download the installable binary file from S3
#

adldap_bin_target_path = node['adldap-install']['install']['adldap_bin_target_path']
adldap_bin_zip = node['adldap-install']['install']['adldap_bin_zip']
adldap_bin_target = "#{adldap_bin_target_path}/#{adldap_bin_zip}"
adldap_bin_source = node['adldap-install']['install']['adldap_bin_source']
tibco_universalinstaller_bin = node['adldap-install']['install']['tibco_universalinstaller_bin']

install_group = node['adldap-install']['install']['group']
install_user = node['adldap-install']['install']['user']

# create the required directories
directory adldap_bin_target_path do
  owner install_user
  group install_group
  mode '0777'
end

# Download the file from S3
remote_file adldap_bin_target do
  source adldap_bin_source
  owner install_user
  group install_group
  mode '0777'
end

# Install the unzip package
package 'unzip'

# Unzip the binary zip file
execute 'unzip_bin_zip' do
  command "unzip #{adldap_bin_target}"
  cwd adldap_bin_target_path
  not_if { File.exist? "#{adldap_bin_target_path}/#{tibco_universalinstaller_bin}" }
end

# Change the ownership of the binary
file "#{adldap_bin_target_path}/#{tibco_universalinstaller_bin}" do
  mode '0755'
end

# Change the permission of all the installation files. This is to copy the downloaded missing assembly file to the assembly directory
execute 'chmod-install-directories' do
  command "chmod -R 777 #{adldap_bin_target_path}"
  user 'root'
  action :run
end
