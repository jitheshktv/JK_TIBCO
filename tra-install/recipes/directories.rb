#
# Cookbook Name:: tra-install
# Recipe:: directories
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#
# Recipe for Creating the required directory structure
#

tibco_home_dir = node['tra-install']['install']['tibco_home_dir']
logs_home_dir = node['tra-install']['install']['logs_home_dir']
tibco_install_dir = node['tra-install']['install']['tibco_install_dir']
tibco_instance_dir = node['tra-install']['install']['tibco_instance_dir']
logs_instance_dir = node['tra-install']['install']['logs_instance_dir']
tra_bin_target_path = node['tra-install']['install']['tra_bin_target_path']
tra_home_dir = node['tra-install']['install']['tra_home_dir']
tibco_cfgmgmt_dir = "#{tibco_install_dir}/tibco_cfg"
tibco_thirdpartydownload_dir = "#{tibco_install_dir}/thirdpartyDownload"

install_user = node['tra-install']['install']['user']
install_group = node['tra-install']['install']['group']
config_user = node['tra-install']['config']['user']
config_group = node['tra-install']['config']['group']

[tibco_home_dir, logs_home_dir, tibco_install_dir, tra_home_dir, tra_bin_target_path, tibco_cfgmgmt_dir, tibco_thirdpartydownload_dir].each do |dir_name|
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
