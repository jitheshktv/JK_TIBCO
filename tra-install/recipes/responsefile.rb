#
# Cookbook Name:: tra-install
# Recipe:: responsefile
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#
# recipe to create the responsefile for the silent mode installation.
#

tra_bin_target_path = node['tra-install']['install']['tra_bin_target_path']
tra_install_responsefile = "#{tra_bin_target_path}/#{node['tra-install']['install']['response_file']}"

template tra_install_responsefile do
  source 'TIBCOInstallResponsefile-tra.silent.erb'
  mode '0755'
end
