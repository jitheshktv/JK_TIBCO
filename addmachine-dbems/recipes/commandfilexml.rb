#
# Cookbook Name:: addmachine-dbems
# Recipe:: commandfilexml
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#
# Generate the AddMachine.xml from the template

# Intialize the variables
addmachine_cmdfile = node['addmachine-dbems']['config']['addmachine_cmdfile']

# Generate the AddMachine.xml from the template
template 'AddMachine.xml' do
  source 'AddMachine.xml.erb'
  mode '0755'
  path addmachine_cmdfile
end
