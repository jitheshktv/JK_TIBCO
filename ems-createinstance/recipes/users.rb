#
# Cookbook Name:: ems-createinstance
# Recipe:: users
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

# Recipe to create the user and group to own the ems installation directory

# Create group. Need to add not_if
group node['ems-createinstance']['config']['group']

# Create user. Needs to add not_if
user node['ems-createinstance']['config']['user'] do
  group node['ems-createinstance']['config']['group']
  home "/home/#{node['ems-createinstance']['config']['user']}"
  shell '/bin/bash'
end
