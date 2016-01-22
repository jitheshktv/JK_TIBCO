#
# Cookbook Name:: sdk-install
# Recipe:: directories
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#
# Recipe for Creating the required directory structure
#

tibco_home_dir = node['sdk-install']['install']['tibco_home_dir']
logs_home_dir = node['sdk-install']['install']['logs_home_dir']
tibco_install_dir = node['sdk-install']['install']['tibco_install_dir']
tibco_instance_dir = node['sdk-install']['install']['tibco_instance_dir']
logs_instance_dir = node['sdk-install']['install']['logs_instance_dir']
sdk_bin_target_path = node['sdk-install']['install']['sdk_bin_target_path']
sdk_home_dir = node['sdk-install']['install']['sdk_home_dir']

install_user = node['sdk-install']['install']['user']
install_group = node['sdk-install']['install']['group']
config_user = node['sdk-install']['config']['user']
config_group = node['sdk-install']['config']['group']

[tibco_home_dir, logs_home_dir, tibco_install_dir, sdk_bin_target_path, sdk_home_dir].each do |dir_name|
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
