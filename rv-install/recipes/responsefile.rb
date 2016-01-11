#
# Cookbook Name:: rv-install
# Recipe:: responsefile
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#
# recipe to create the responsefile for the silent mode installation.
#

rv_bin_target_path = node['rv-install']['install']['rv_bin_target_path']
rv_install_responsefile = "#{rv_bin_target_path}/#{node['rv-install']['install']['response_file']}"

template rv_install_responsefile do
  source 'TIBCOInstallResponsefile-rv.silent.erb'
  mode '0755'
end
