#
# Cookbook Name:: tibcohome-create
# Recipe:: users
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

# Create group.
config_group = node['tibcohome-create']['config']['group']
config_user = node['tibcohome-create']['config']['user']

group config_group

# Create user.
user config_user do
  group config_group
  home "/home/#{config_user}"
  shell '/bin/bash'
end
