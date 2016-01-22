#
# Cookbook Name:: sdk-install
# Recipe:: responsefile
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#
# recipe to create the responsefile for the silent mode installation.
#

sdk_bin_target_path = node['sdk-install']['install']['sdk_bin_target_path']
sdk_install_responsefile = "#{sdk_bin_target_path}/#{node['sdk-install']['install']['response_file']}"

template sdk_install_responsefile do
  source 'TIBCOInstallResponsefile-sdk.silent.erb'
  mode '0755'
end
