#
# Cookbook Name:: addmachine-dbems
# Recipe:: tnsfile
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#
# Generate the tnsnames.ora file for DB connection
#

# variables
config_user = node['addmachine-dbems']['config']['user']
config_group = node['addmachine-dbems']['config']['group']

db_use_tns = node['addmachine-dbems']['config']['db_use_tns']
tnsfile = node['addmachine-dbems']['config']['db_tnsfile']

# Create the TNS file if TNS is used in the admin domain creation
if "#{db_use_tns}" == 'true'
  template 'tnsnames.ora' do
    source 'tnsnames.ora.erb'
    mode '0755'
    path tnsfile
    owner config_user
    group config_group
  end
end
