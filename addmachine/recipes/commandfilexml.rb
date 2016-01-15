#
# Cookbook Name:: addmachine
# Recipe:: commandfilexml
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#
# Generate the AddMachine.xml from the template

config_user = node['addmachine-rv']['config']['user']
config_group = node['addmachine-rv']['config']['group']
addmachine_cmdfile = node['addmachine-rv']['config']['addmachine_cmdfile']

template 'AddMachine.xml' do
  source 'AddMachine.xml.erb'
  mode '0755'
  path addmachine_cmdfile
end
