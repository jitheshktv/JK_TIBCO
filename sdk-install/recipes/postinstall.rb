#
# Cookbook Name:: sdk-install
# Recipe:: postinstall
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

sdk_bin_target_path = node['sdk-install']['install']['sdk_bin_target_path']

# Clean up the temporary files used for the installation.
directory 'install_bin_file' do
  path sdk_bin_target_path
  recursive true
  action :delete
end
