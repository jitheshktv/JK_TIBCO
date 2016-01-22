#
# Cookbook Name:: sdk-install
# Recipe:: users
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#
# Create group.
#
install_group = node['sdk-install']['install']['group']
config_group = node['sdk-install']['config']['group']
install_user = node['sdk-install']['install']['user']
config_user = node['sdk-install']['config']['user']

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
