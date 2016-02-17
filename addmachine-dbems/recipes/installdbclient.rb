#
# Cookbook Name:: addmachine-dbems
# Recipe:: installdbclient
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#
# This recipe is temporarily kept here. This should be deleted once a seperate Cookbook for installing db client jar files have been created.
# The JARs can be kept in S3 and downloaded from there

# Intialize the variables

tibco_instance_dir = node['addmachine-dbems']['config']['tibco_instance_dir']
tra_version  = node['addmachine-dbems']['config']['tra_version']
tra_home_dir = "#{tibco_instance_dir}/tra/#{tra_version}"
tra_lib = "#{tra_home_dir}/lib"
config_user = node['addmachine-dbems']['config']['user']
config_group = node['addmachine-dbems']['config']['group']

# Copy the Oracle DB driver to the server tra lib directory from the files
cookbook_file 'ojdbc.jar' do
  source 'ojdbc6.jar'
  owner config_user
  group config_group
  mode '0755'
  path "#{tra_lib}/ojdbc6.jar"
end
