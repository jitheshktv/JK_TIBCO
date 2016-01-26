#
# Cookbook Name:: adldap-install
# Recipe:: responsefile
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#
# recipe to create the responsefile for the silent mode installation.
#

adldap_bin_target_path = node['adldap-install']['install']['adldap_bin_target_path']
adldap_install_responsefile = "#{adldap_bin_target_path}/#{node['adldap-install']['install']['response_file']}"

template adldap_install_responsefile do
  source 'TIBCOInstallResponsefile-adldap.silent.erb'
  mode '0755'
end
