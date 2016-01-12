#
# Cookbook Name:: bw-install
# Recipe:: responsefile
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#
# recipe to create the responsefile for the silent mode installation.
#

bw_bin_target_path = node['bw-install']['install']['bw_bin_target_path']
bw_install_responsefile = "#{bw_bin_target_path}/#{node['bw-install']['install']['response_file']}"

template bw_install_responsefile do
  source 'TIBCOInstallResponsefile-bw.silent.erb'
  mode '0755'
end
