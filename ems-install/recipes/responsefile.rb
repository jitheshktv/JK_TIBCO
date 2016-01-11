#
# Cookbook Name:: ems-install
# Recipe:: responsefile
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

# recipe to create the response file for the EMS installation

ems_bin_target_path = node['ems-install']['install']['ems_bin_target_path']
ems_install_responsefile = "#{ems_bin_target_path}/#{node['ems-install']['install']['response_file']}"

template ems_install_responsefile do
  source 'emsInstallResponsefile.silent.erb'
  mode '0755'
end
