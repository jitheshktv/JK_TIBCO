#
# Cookbook Name:: bwplugincopybook-install
# Recipe:: responsefile
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#
# recipe to create the responsefile for the silent mode installation.
#

bwplugincopybook_bin_target_path = node['bwplugincopybook-install']['install']['bwplugincopybook_bin_target_path']
bwplugincopybook_install_responsefile = "#{bwplugincopybook_bin_target_path}/#{node['bwplugincopybook-install']['install']['response_file']}"

template bwplugincopybook_install_responsefile do
  source 'TIBCOInstallResponsefile-bwplugincopybook.silent.erb'
  mode '0755'
end
