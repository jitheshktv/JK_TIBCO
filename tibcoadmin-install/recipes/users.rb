#
# Cookbook Name:: tibcoadmin-install
# Recipe:: users
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#
# Create group.
#
install_group = node['tibcoadmin-install']['install']['group']
config_group = node['tibcoadmin-install']['config']['group']
install_user = node['tibcoadmin-install']['install']['user']
config_user = node['tibcoadmin-install']['config']['user']

group install_group
group config_group

# Create user.
user install_user do
  group install_group
  home "/home/#{install_user}"
  shell '/bin/bash'
end

user config_user do
  group config_group
  home "/home/#{config_user}"
  shell '/bin/bash'
end
