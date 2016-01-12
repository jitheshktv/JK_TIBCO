#
# Cookbook Name:: tibcoadmin-install
# Recipe:: responsefile
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#
# recipe to create the responsefile for the silent mode installation.
#

tibcoadmin_bin_target_path = node['tibcoadmin-install']['install']['tibcoadmin_bin_target_path']
tibcoadmin_install_responsefile = "#{tibcoadmin_bin_target_path}/#{node['tibcoadmin-install']['install']['response_file']}"

template tibcoadmin_install_responsefile do
  source 'TIBCOInstallResponsefile-tibadmin.silent.erb'
  mode '0755'
end
