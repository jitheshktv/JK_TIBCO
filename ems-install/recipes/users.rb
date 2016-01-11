#
# Cookbook Name:: ems-install
# Recipe:: users
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

# Recipe to create the user and group to own the ems installation directory

# Create group. Need to add not_if
group node['ems-install']['install']['group']

# Create user. Needs to add not_if
user node['ems-install']['install']['user'] do
  group node['ems-install']['install']['group']
  home "/home/#{node['ems-install']['install']['user']}"
  shell '/bin/bash'
end
