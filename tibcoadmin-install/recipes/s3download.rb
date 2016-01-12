#
# Cookbook Name:: tibcoadmin-install
# Recipe:: s3download
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

# Recipe to download the installable binary file from S3
#

tibcoadmin_bin_target_path = node['tibcoadmin-install']['install']['tibcoadmin_bin_target_path']
tibcoadmin_bin_zip = node['tibcoadmin-install']['install']['tibcoadmin_bin_zip']
tibcoadmin_bin_target = "#{tibcoadmin_bin_target_path}/#{tibcoadmin_bin_zip}"
tibcoadmin_bin_source = node['tibcoadmin-install']['install']['tibcoadmin_bin_source']
tibco_universalinstaller_bin = node['tibcoadmin-install']['install']['tibco_universalinstaller_bin']

install_group = node['tibcoadmin-install']['install']['group']
install_user = node['tibcoadmin-install']['install']['user']

# create the required directories
directory tibcoadmin_bin_target_path do
  owner install_user
  group install_group
  mode '0777'
end

# Download the file from S3
remote_file tibcoadmin_bin_target do
  source tibcoadmin_bin_source
  owner install_user
  group install_group
  mode '0777'
end

# Install the unzip package
package 'unzip'

# Unzip the binary zip file
execute 'unzip_bin_zip' do
  command "unzip #{tibcoadmin_bin_target}"
  cwd tibcoadmin_bin_target_path
  not_if { File.exist? "#{tibcoadmin_bin_target_path}/#{tibco_universalinstaller_bin}" }
end

# Change the ownership of the binary
file "#{tibcoadmin_bin_target_path}/#{tibco_universalinstaller_bin}" do
  mode '0755'
end
