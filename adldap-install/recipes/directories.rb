#
# Cookbook Name:: adldap-install
# Recipe:: directories
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#
# Recipe for Creating the required directory structure
#

tibco_home_dir = node['adldap-install']['install']['tibco_home_dir']
logs_home_dir = node['adldap-install']['install']['logs_home_dir']
tibco_install_dir = node['adldap-install']['install']['tibco_install_dir']
tibco_instance_dir = node['adldap-install']['install']['tibco_instance_dir']
logs_instance_dir = node['adldap-install']['install']['logs_instance_dir']
adldap_bin_target_path = node['adldap-install']['install']['adldap_bin_target_path']
adldap_major_version = node['adldap-install']['install']['adldap_major_version']
adldap_home_dir = "#{tibco_install_dir}/adapter/adldap/#{adldap_major_version}"
tibco_cfgmgmt_dir = "#{tibco_install_dir}/tibco_cfg"
tibco_thirdpartydownload_dir = "#{tibco_install_dir}/thirdpartyDownload"

install_user = node['adldap-install']['install']['user']
install_group = node['adldap-install']['install']['group']
config_user = node['adldap-install']['config']['user']
config_group = node['adldap-install']['config']['group']

[tibco_home_dir, logs_home_dir, tibco_install_dir, adldap_home_dir, adldap_bin_target_path, tibco_cfgmgmt_dir, tibco_thirdpartydownload_dir].each do |dir_name|
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
