#
# Cookbook Name:: createdomain-dbems
# Recipe:: installdbclient
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#
# This recipe is temporarily kept here. This should be deleted once a seperate Cookbook for installing db client jar files have been created.
# The JARs can be kept in S3 and downloaded from there

# Variables
tra_home_dir = node['createdomain-dbems']['config']['tra_home_dir']
tra_lib = "#{tra_home_dir}/lib"
config_user = node['createdomain-dbems']['config']['user']
config_group = node['createdomain-dbems']['config']['group']

# Install the Oracle DB driver to the target server tra lib direcrory from the cookbook files.
cookbook_file 'ojdbc.jar' do
  source 'ojdbc6.jar'
  owner config_user
  group config_group
  mode '0755'
  path "#{tra_lib}/ojdbc6.jar"
end
