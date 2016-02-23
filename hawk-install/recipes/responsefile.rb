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

hawk_major_version = node['hawk-install']['install']['hawk_major_version']

if hawk_major_version >= '5.0'
  response_file = 'TIBCOInstallResponsefile-hawk-5.x.silent.erb'
else
  response_file = 'TIBCOInstallResponsefile-hawk-4.x.silent.erb'
end

template hawk_install_responsefile do
  source response_file
  mode '0755'
end
