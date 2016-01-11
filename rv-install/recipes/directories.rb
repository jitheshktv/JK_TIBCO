#
# Cookbook Name:: rv-install
# Recipe:: directories
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#
# Recipe for Creating the required directory structure
#

tibco_home_dir = node['rv-install']['install']['tibco_home_dir']
logs_home_dir = node['rv-install']['install']['logs_home_dir']
tibco_install_dir = node['rv-install']['install']['tibco_install_dir']
tibco_instance_dir = node['rv-install']['install']['tibco_instance_dir']
logs_instance_dir = node['rv-install']['install']['logs_instance_dir']
rv_bin_target_path = node['rv-install']['install']['rv_bin_target_path']
rv_home_dir = node['rv-install']['install']['rv_home_dir']

install_user = node['rv-install']['install']['user']
install_group = node['rv-install']['install']['group']
config_user = node['rv-install']['config']['user']
config_group = node['rv-install']['config']['group']

directory tibco_home_dir do
  owner install_user
  group install_group
  mode '0755'
  recursive true
  action :create
end

directory logs_home_dir do
  owner install_user
  group install_group
  mode '0755'
  recursive true
  action :create
end

directory tibco_install_dir do
  owner install_user
  group install_group
  mode '0755'
  recursive true
  action :create
end

directory rv_home_dir do
  owner install_user
  group install_group
  mode '0755'
  recursive true
  action :create
end

directory tibco_instance_dir do
  owner config_user
  group config_group
  mode '0755'
  recursive true
  action :create
end

directory logs_instance_dir do
  owner config_user
  group config_group
  mode '0755'
  recursive true
  action :create
end

directory rv_bin_target_path do
  owner install_user
  group install_group
  mode '0755'
  recursive true
  action :create
end
