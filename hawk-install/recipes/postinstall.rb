#
# Cookbook Name:: hawk-install
# Recipe:: postinstall
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

hawk_bin_target_path = node['hawk-install']['install']['hawk_bin_target_path']

# Clean up the temporary files used for the installation.
directory 'install_bin_file' do
  path hawk_bin_target_path
  recursive true
  action :delete
end
