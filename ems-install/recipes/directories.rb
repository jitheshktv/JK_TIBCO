#
# Cookbook Name:: ems-install
# Recipe:: directories
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
# recipe to create the directory structure needed for the ems installation

# Create the directories
directory node['ems-install']['install']['tibco_home_dir'] do
  owner node['ems-install']['install']['user']
  group node['ems-install']['install']['group']
  mode '0755'
  recursive true
  action :create
end

directory node['ems-install']['install']['logs_home_dir'] do
  owner node['ems-install']['install']['user']
  group node['ems-install']['install']['group']
  mode '0755'
  recursive true
  action :create
end

directory node['ems-install']['install']['ems_install_dir'] do
  owner node['ems-install']['install']['user']
  group node['ems-install']['install']['group']
  mode '0755'
  recursive true
  action :create
end

directory node['ems-install']['install']['ems_log_dir'] do
  owner node['ems-install']['install']['user']
  group node['ems-install']['install']['group']
  mode '0755'
  recursive true
  action :create
end

directory node['ems-install']['config']['ems_conf_templates_dir'] do
  owner node['ems-install']['install']['user']
  group node['ems-install']['install']['group']
  mode '0755'
  recursive true
  action :create
end

file node['ems-install']['config']['ems_conf_tibemsd'] do
  owner node['ems-install']['install']['user']
  group node['ems-install']['install']['group']
  mode '0755'
  content 'sample tibesmd.conf file'
end
