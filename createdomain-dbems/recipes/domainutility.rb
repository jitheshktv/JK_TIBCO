#
# Cookbook Name:: createdomain-dbems
# Recipe:: domainutility
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#
# Run the domainutility to create domain
#

# variables
config_user = node['createdomain-dbems']['config']['user']
config_group = node['createdomain-dbems']['config']['group']
tra_home_dir = node['createdomain-dbems']['config']['tra_home_dir']
tra_bin = "#{tra_home_dir}/bin"
createdomain_cmdfile = node['createdomain-dbems']['config']['createdomain_cmdfile']

domain_name = node['createdomain-dbems']['config']['domain_name']
tibcoadmin_domainhome_dir = node['createdomain-dbems']['config']['tibcoadmin_domainhome_dir']
tra_domainhome_dir = node['createdomain-dbems']['config']['tra_domainhome_dir']
tra_domain_dir = "#{tra_domainhome_dir}/#{domain_name}"
hawkagent = "#{tra_domain_dir}/hawkagent_#{domain_name}"
tibcoadmin_bin_dir = "#{tibcoadmin_domainhome_dir}/#{domain_name}/bin"
administrator = "#{tibcoadmin_bin_dir}/tibcoadmin_#{domain_name}"

# Install the required yum packages for running 32 bit domainutility on a 64 bit OS arch
case node['platform']
when 'redhat', 'centos', 'ubuntu'
  yum_package 'glibc.i686'
  yum_package 'libstdc++.i686'
when  'fedora'
  yum_package 'glibc.i686'
  yum_package 'libstdc++48.i686'
end

# Execute the domain utility to create the domain
execute 'create_domain' do
  command "./domainutilitycmd -cmdFile #{createdomain_cmdfile}"
  cwd tra_bin
  user config_user
  group config_group
  not_if { File.exist? "#{hawkagent}" }
end

# Start the hawkagent
execute 'start_hawkagent' do
  command "nohup #{hawkagent} 2>&1 &"
  cwd tra_domain_dir
  user config_user
  group config_group
end

# Start the administrator
execute 'start_admin' do
  command "nohup #{administrator} 2>&1 &"
  cwd tibcoadmin_bin_dir
  user config_user
  group config_group
end
