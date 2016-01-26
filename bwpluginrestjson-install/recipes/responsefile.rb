#
# Cookbook Name:: bwpluginrestjson-install
# Recipe:: responsefile
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#
# recipe to create the responsefile for the silent mode installation.
#

bwpluginrestjson_bin_target_path = node['bwpluginrestjson-install']['install']['bwpluginrestjson_bin_target_path']
bwpluginrestjson_install_responsefile = "#{bwpluginrestjson_bin_target_path}/#{node['bwpluginrestjson-install']['install']['response_file']}"

template bwpluginrestjson_install_responsefile do
  source 'TIBCOInstallResponsefile-bwpluginrestjson.silent.erb'
  mode '0755'
end
