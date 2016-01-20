#
# Cookbook Name:: ems-createinstance
# Recipe:: directories
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
# recipe to create the directory structure needed for the ems installation

# Create the directories

config_user = node['ems-createinstance']['config']['user']
config_group = node['ems-createinstance']['config']['group']

tibco_config_home = node['ems-createinstance']['config']['tibco_config_home']
tibco_cert_home = node['ems-createinstance']['config']['tibco_cert_home']
ems_log_home = node['ems-createinstance']['config']['ems_log_home']
ems_config_home = node['ems-createinstance']['config']['ems_config_home']
tibemsd_conf_path = node['ems-createinstance']['config']['tibemsd_conf_path']
shared_conf_path = node['ems-createinstance']['config']['shared_conf_path']
shared_data_store = node['ems-createinstance']['config']['shared_data_store']
ems_instance_logdir = node['ems-createinstance']['config']['ems_instance_logdir']
trusted_store_path = node['ems-createinstance']['config']['trusted_store_path']
cert_store_path = node['ems-createinstance']['config']['cert_store_path']

[tibco_config_home, tibco_cert_home, ems_log_home, ems_config_home, tibemsd_conf_path, shared_conf_path, shared_data_store, ems_instance_logdir, trusted_store_path, cert_store_path].each do |dir_name|
  directory dir_name do
    owner config_user
    group config_group
    mode '0755'
    recursive true
    action :create
  end
end
