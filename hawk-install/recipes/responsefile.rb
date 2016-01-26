#
# Cookbook Name:: hawk-install
# Recipe:: responsefile
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#
# recipe to create the responsefile for the silent mode installation.
#

hawk_bin_target_path = node['hawk-install']['install']['hawk_bin_target_path']
hawk_install_responsefile = "#{hawk_bin_target_path}/#{node['hawk-install']['install']['response_file']}"

template hawk_install_responsefile do
  source 'TIBCOInstallResponsefile-hawk.silent.erb'
  mode '0755'
end
