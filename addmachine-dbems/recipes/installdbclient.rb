#
# Cookbook Name:: addmachine-dbems
# Recipe:: installdbclient
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#
# This recipe is temporarily kept here. This should be deleted once a seperate Cookbook for installing db client jar files have been created.
# The JARs can be kept in S3 and downloaded from there

tra_home_dir = node['addmachine-dbems']['config']['tra_home_dir']
tra_lib = "#{tra_home_dir}/lib"
config_user = node['addmachine-dbems']['config']['user']
config_group = node['addmachine-dbems']['config']['group']

cookbook_file 'ojdbc.jar' do
  source 'ojdbc6.jar'
  owner config_user
  group config_group
  mode '0755'
  path "#{tra_lib}/ojdbc6.jar"
end
