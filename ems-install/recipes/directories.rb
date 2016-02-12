#
# Cookbook Name:: ems-install
# Recipe:: directories
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
# recipe to create the directory structure needed for the ems installation

# Create the directories

tibco_home_dir = node['ems-install']['install']['tibco_home_dir']
logs_home_dir = node['ems-install']['install']['logs_home_dir']
ems_log_dir = node['ems-install']['install']['ems_log_dir']
ems_install_dir = node['ems-install']['install']['ems_install_dir']
ems_major_version = node['ems-install']['install']['ems_major_version']
ems_conf_templates_dir = "#{ems_install_dir}/ems/#{ems_major_version}/config/templates/conf"
ems_conf_tibemsd = "#{ems_conf_templates_dir}/tibemsd.conf"

user_name = node['ems-install']['install']['user']
group_name = node['ems-install']['install']['group']

[tibco_home_dir, logs_home_dir, ems_install_dir, ems_log_dir, ems_conf_templates_dir].each do |dir_name|
  directory dir_name do
    owner user_name
    group group_name
    mode '0755'
    recursive true
    action :create
  end
end

file ems_conf_tibemsd do
  owner user_name
  group group_name
  mode '0755'
  content 'sample tibesmd.conf file'
end
