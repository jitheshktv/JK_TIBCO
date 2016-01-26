#
# Cookbook Name:: bwplugincopybook-install
# Recipe:: directories
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#
# Recipe for Creating the required directory structure
#

tibco_home_dir = node['bwplugincopybook-install']['install']['tibco_home_dir']
logs_home_dir = node['bwplugincopybook-install']['install']['logs_home_dir']
tibco_install_dir = node['bwplugincopybook-install']['install']['tibco_install_dir']
tibco_instance_dir = node['bwplugincopybook-install']['install']['tibco_instance_dir']
logs_instance_dir = node['bwplugincopybook-install']['install']['logs_instance_dir']
bwplugincopybook_bin_target_path = node['bwplugincopybook-install']['install']['bwplugincopybook_bin_target_path']
bwplugincopybook_home_dir = node['bwplugincopybook-install']['install']['bwplugincopybook_home_dir']

install_user = node['bwplugincopybook-install']['install']['user']
install_group = node['bwplugincopybook-install']['install']['group']
config_user = node['bwplugincopybook-install']['config']['user']
config_group = node['bwplugincopybook-install']['config']['group']

[tibco_home_dir, logs_home_dir, tibco_install_dir, bwplugincopybook_home_dir, bwplugincopybook_bin_target_path].each do |dir_name|
  directory dir_name do
    owner install_user
    group install_group
    path dir_name
    mode '0755'
    recursive true
    action :create
  end
end

[tibco_instance_dir, logs_instance_dir].each do |dir_name|
  directory dir_name do
    owner config_user
    group config_group
    path dir_name
    mode '0755'
    recursive true
    action :create
  end
end
