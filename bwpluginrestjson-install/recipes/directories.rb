#
# Cookbook Name:: bwpluginrestjson-install
# Recipe:: directories
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#
# Recipe for Creating the required directory structure
#

tibco_home_dir = node['bwpluginrestjson-install']['install']['tibco_home_dir']
logs_home_dir = node['bwpluginrestjson-install']['install']['logs_home_dir']
tibco_install_dir = node['bwpluginrestjson-install']['install']['tibco_install_dir']
tibco_instance_dir = node['bwpluginrestjson-install']['install']['tibco_instance_dir']
logs_instance_dir = node['bwpluginrestjson-install']['install']['logs_instance_dir']
bwpluginrestjson_bin_target_path = node['bwpluginrestjson-install']['install']['bwpluginrestjson_bin_target_path']
bwpluginrestjson_home_dir = node['bwpluginrestjson-install']['install']['bwpluginrestjson_home_dir']

install_user = node['bwpluginrestjson-install']['install']['user']
install_group = node['bwpluginrestjson-install']['install']['group']
config_user = node['bwpluginrestjson-install']['config']['user']
config_group = node['bwpluginrestjson-install']['config']['group']

[tibco_home_dir, logs_home_dir, tibco_install_dir, bwpluginrestjson_home_dir, bwpluginrestjson_bin_target_path, tibco_cfgmgmt_dir, tibco_thirdpartydownload_dir].each do |dir_name|
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
