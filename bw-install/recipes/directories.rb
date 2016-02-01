#
# Cookbook Name:: bw-install
# Recipe:: directories
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#
# Recipe for Creating the required directory structure
#

tibco_home_dir = node['bw-install']['install']['tibco_home_dir']
logs_home_dir = node['bw-install']['install']['logs_home_dir']
tibco_install_dir = node['bw-install']['install']['tibco_install_dir']
tibco_instance_dir = node['bw-install']['install']['tibco_instance_dir']
logs_instance_dir = node['bw-install']['install']['logs_instance_dir']
bw_bin_target_path = node['bw-install']['install']['bw_bin_target_path']
bw_version = node['bw-install']['install']['bw_version']
bw_home_dir = "#{tibco_install_dir}/bw/#{bw_version}"

install_user = node['bw-install']['install']['user']
install_group = node['bw-install']['install']['group']
config_user = node['bw-install']['config']['user']
config_group = node['bw-install']['config']['group']

[tibco_home_dir, logs_home_dir, tibco_install_dir, bw_home_dir, bw_bin_target_path].each do |dir_name|
  directory dir_name do
    owner install_user
    group install_group
    mode '0755'
    recursive true
    action :create
  end
end

[tibco_instance_dir, logs_instance_dir].each do |dir_name|
  directory dir_name do
    owner config_user
    group config_group
    mode '0755'
    recursive true
    action :create
  end
end
