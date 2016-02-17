#
# Cookbook Name:: addmachine-dbems
# Recipe:: domainutility
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#
# Run the domainutility to add domain to the domain
#

# Intialize the variables
config_user = node['addmachine-dbems']['config']['user']
config_group = node['addmachine-dbems']['config']['group']

tibco_instance_dir = node['addmachine-dbems']['config']['tibco_instance_dir']
tra_version  = node['addmachine-dbems']['config']['tra_version']
tra_home_dir = "#{tibco_instance_dir}/tra/#{tra_version}"
tra_bin = "#{tra_home_dir}/bin"
domain_name = node['addmachine-dbems']['config']['domain_name']
tra_domainhome_dir = "#{tibco_instance_dir}/tra/domain"
tra_domain_dir = "#{tra_domainhome_dir}/#{domain_name}"
hawkagent = "#{tra_domain_dir}/hawkagent_#{domain_name}"

addmachine_cmdfile = node['addmachine-dbems']['config']['addmachine_cmdfile']

# Install the required yum packages for running 32 bit domainutility on a 64 bit OS arch
case node['platform']
when 'redhat', 'centos', 'ubuntu'
  yum_package 'glibc.i686'
  yum_package 'libstdc++.i686'
when 'amazon'
  yum_package 'glibc.i686'
  yum_package 'libstdc++48.i686'
end

# Execute the domain utility to add machine to the domain
execute 'addmachine' do
  command "./domainutilitycmd -cmdFile #{addmachine_cmdfile}"
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
