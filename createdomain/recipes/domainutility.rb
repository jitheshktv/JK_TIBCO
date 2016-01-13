#
# Cookbook Name:: createdomain
# Recipe:: domainutility
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#
# Run the domainutility to create domain
#

config_user = node['createdomain-rv']['config']['user']
config_group = node['createdomain-rv']['config']['group']
tra_home_dir = node['createdomain-rv']['config']['tra_home_dir']
domainutilitycmd = "#{tra_home_dir}/bin/domainutilitycmd"
createdomain_cmdfile = node['createdomain-rv']['config']['createdomain_cmdfile']

# Install the required yum packages for 32 bit
yum_package 'glibc.i686'
yum_package 'libstdc++48.i686'

# Execute the domain utility
execute 'create_domain' do
  command "#{domainutilitycmd} --cmdFile #{createdomain_cmdfile}"
  user install_user
  group install_group
end
