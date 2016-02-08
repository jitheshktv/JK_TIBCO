#
# Cookbook Name:: tibcoadmin-install
# Recipe:: directories
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#
# Recipe for Creating the required directory structure
#

tibco_home_dir = node['tibcoadmin-install']['install']['tibco_home_dir']
logs_home_dir = node['tibcoadmin-install']['install']['logs_home_dir']
tibco_install_dir = node['tibcoadmin-install']['install']['tibco_install_dir']
tibco_instance_dir = node['tibcoadmin-install']['install']['tibco_instance_dir']
logs_instance_dir = node['tibcoadmin-install']['install']['logs_instance_dir']
tibcoadmin_bin_target_path = node['tibcoadmin-install']['install']['tibcoadmin_bin_target_path']
tibcoadmin_version = node['tibcoadmin-install']['install']['tibcoadmin_version']
tibcoadmin_home_dir = "#{tibco_install_dir}/administrator/#{tibcoadmin_version}"

install_user = node['tibcoadmin-install']['install']['user']
install_group = node['tibcoadmin-install']['install']['group']
config_user = node['tibcoadmin-install']['config']['user']
config_group = node['tibcoadmin-install']['config']['group']

[tibco_home_dir, logs_home_dir, tibco_install_dir, tibcoadmin_home_dir, tibcoadmin_bin_target_path].each do |dir_name|
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
