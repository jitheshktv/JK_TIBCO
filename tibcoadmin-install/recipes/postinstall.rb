#
# Cookbook Name:: tibcoadmin-install
# Recipe:: postinstall
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#
# Recipe to do the post install activities

tibcoadmin_bin_target_path = node['tibcoadmin-install']['install']['tibcoadmin_bin_target_path']

# Clean up the temporary files used for the installation.
directory 'install_bin_file' do
  path tibcoadmin_bin_target_path
  recursive true
  action :delete
end
