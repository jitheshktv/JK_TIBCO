#
# Cookbook Name:: ems-install
# Recipe:: installems
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

ems_bin_target_path = node['ems-install']['install']['ems_bin_target_path']
ems_install_responsefile = "#{ems_bin_target_path}/#{node['ems-install']['install']['response_file']}"
ems_bin = "#{ems_bin_target_path}/#{node['ems-install']['install']['linux_bin']}"
group_name = node['ems-install']['install']['group']
user_name = node['ems-install']['install']['user']
ems_install_dir = node['ems-install']['install']['ems_install_dir']
ems_conf_templates_dir = node['ems-install']['config']['ems_conf_templates_dir']
tibemsd = node['ems-install']['config']['ems_tibemsd']
default_cfgmgmt = node['ems-install']['config']['default_cfgmgmt']
ENV['JAVA_HOME'] = '/usr/lib/jvm/java'

# Install ems binary using the response file
execute 'installems' do
  command "#{ems_bin} -silent -V responseFile=#{ems_install_responsefile}"
  not_if { File.exist? "#{tibemsd}" }
end

# Create the EMS config files from templates
template "#{ems_conf_templates_dir}/acl.conf" do
  source 'acl.conf.erb'
  mode '0755'
end

template "#{ems_conf_templates_dir}/bridges.conf" do
  source 'bridges.conf.erb'
  mode '0755'
end

template "#{ems_conf_templates_dir}/channels.conf" do
  source 'channels.conf.erb'
  mode '0755'
end
template "#{ems_conf_templates_dir}/durables.conf" do
  source 'durables.conf.erb'
  mode '0755'
end
template "#{ems_conf_templates_dir}/factories.conf" do
  source 'factories.conf.erb'
  mode '0755'
end

template "#{ems_conf_templates_dir}/groups.conf" do
  source 'groups.conf.erb'
  mode '0755'
end

template "#{ems_conf_templates_dir}/queues.conf" do
  source 'queues.conf.erb'
  mode '0755'
end

template "#{ems_conf_templates_dir}/routes.conf" do
  source 'routes.conf.erb'
  mode '0755'
end

template "#{ems_conf_templates_dir}/stores.conf" do
  source 'stores.conf.erb'
  mode '0755'
end

template "#{ems_conf_templates_dir}/tibemsd.conf" do
  source 'tibemsd.conf.erb'
  mode '0755'
end

template "#{ems_conf_templates_dir}/tibrvcm.conf" do
  source 'tibrvcm.conf.erb'
  mode '0755'
end

template "#{ems_conf_templates_dir}/topics.conf" do
  source 'topics.conf.erb'
  mode '0755'
end

template "#{ems_conf_templates_dir}/transports.conf" do
  source 'transports.conf.erb'
  mode '0755'
end

template "#{ems_conf_templates_dir}/users.conf" do
  source 'users.conf.erb'
  mode '0755'
end

# Remove the defult cofgmgmt directory
directory default_cfgmgmt do
  recursive true
  action :delete
end

# Change the ownership of the directories
execute 'chown-ems-files' do
  command "chown -R #{user_name}:#{group_name} #{ems_install_dir}"
  user 'root'
  action :run
end
