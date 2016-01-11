#
# Cookbook Name:: ems-createinstance
# Recipe:: directories
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
# recipe to create the directory structure needed for the ems installation

# Create the directories

# %w( #{node['ems-createinstance']['config']['tibco_config_home']} #{node['ems-createinstance']['config']['tibco_cert_home']} #{node['ems-createinstance']['config']['ems_log_home']} ).each do |path|
#  directory path do
#    owner node['ems-createinstance']['config']['user']
#    group node['ems-createinstance']['config']['group']
#    mode '0755'
#    recursive true
#  end
# end
directory node['ems-createinstance']['config']['tibco_config_home'] do
  owner node['ems-createinstance']['config']['user']
  group node['ems-createinstance']['config']['group']
  mode '0755'
  recursive true
  action :create
end

directory node['ems-createinstance']['config']['tibco_cert_home'] do
  owner node['ems-createinstance']['config']['user']
  group node['ems-createinstance']['config']['group']
  mode '0755'
  recursive true
  action :create
end

directory node['ems-createinstance']['config']['ems_log_home'] do
  owner node['ems-createinstance']['config']['user']
  group node['ems-createinstance']['config']['group']
  mode '0755'
  recursive true
  action :create
end

directory node['ems-createinstance']['config']['ems_config_home'] do
  owner node['ems-createinstance']['config']['user']
  group node['ems-createinstance']['config']['group']
  mode '0755'
  recursive true
  action :create
end

directory node['ems-createinstance']['config']['tibemsd_conf_path'] do
  owner node['ems-createinstance']['config']['user']
  group node['ems-createinstance']['config']['group']
  mode '0755'
  recursive true
  action :create
end

directory node['ems-createinstance']['config']['shared_conf_path'] do
  owner node['ems-createinstance']['config']['user']
  group node['ems-createinstance']['config']['group']
  mode '0755'
  recursive true
  action :create
end

directory node['ems-createinstance']['config']['shared_data_store'] do
  owner node['ems-createinstance']['config']['user']
  group node['ems-createinstance']['config']['group']
  mode '0755'
  recursive true
  action :create
end

directory node['ems-createinstance']['config']['ems_instance_logdir'] do
  owner node['ems-createinstance']['config']['user']
  group node['ems-createinstance']['config']['group']
  mode '0755'
  recursive true
  action :create
end

directory node['ems-createinstance']['config']['trusted_store_path'] do
  owner node['ems-createinstance']['config']['user']
  group node['ems-createinstance']['config']['group']
  mode '0755'
  recursive true
  action :create
end

directory node['ems-createinstance']['config']['cert_store_path'] do
  owner node['ems-createinstance']['config']['user']
  group node['ems-createinstance']['config']['group']
  mode '0755'
  recursive true
  action :create
end
