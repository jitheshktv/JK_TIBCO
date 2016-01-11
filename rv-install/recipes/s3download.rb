#
# Cookbook Name:: rv-install
# Recipe:: s3download
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#
# Recipe to download the installable binary file from S3
#

rv_bin_target_path = node['rv-install']['install']['rv_bin_target_path']
rv_bin_zip = node['rv-install']['install']['rv_bin_zip']
rv_bin_target = "#{rv_bin_target_path}/#{rv_bin_zip}"
rv_bin_source = node['rv-install']['install']['rv_bin_source']
tibco_universalinstaller_bin = node['rv-install']['install']['tibco_universalinstaller_bin']

install_group = node['rv-install']['install']['group']
install_user = node['rv-install']['install']['user']

# create the required directories
directory rv_bin_target_path do
  owner install_user
  group install_group
  mode '0777'
end

# Download the file from S3
remote_file rv_bin_target do
  source rv_bin_source
  owner install_user
  group install_group
  mode '0777'
end

# Install the unzip package
package 'unzip'

# Unzip the binary zip file
execute 'unzip_bin_zip' do
  command "unzip #{rv_bin_target}"
  cwd rv_bin_target_path
  not_if { File.exist? "#{rv_bin_target_path}/#{tibco_universalinstaller_bin}" }
end

# Change the ownership of the binary
file "#{rv_bin_target_path}/#{tibco_universalinstaller_bin}" do
  mode '0755'
end
