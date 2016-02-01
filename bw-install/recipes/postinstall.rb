#
# Cookbook Name:: bw-install
# Recipe:: postinstall
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

# Post install steps

tibco_install_dir = node['bw-install']['install']['tibco_install_dir']
bw_version = node['bw-install']['install']['bw_version']
bw_home_dir = "#{tibco_install_dir}/bw/#{bw_version}"
bwengine_tra = "#{bw_home_dir}/bin/bwengine.tra"

install_group = node['bw-install']['install']['group']
install_user = node['bw-install']['install']['user']

# Generate the bwengine.tra from template
template bwengine_tra do
  source 'bwengine.tra.erb'
  path bwengine_tra
  mode '0755'
end
