#
# Cookbook Name:: ems-install
# Recipe:: prepareconfig
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

# Commenting the below as it throws compilation error and the file doesnt created until the ems-install recipe runs.
# file "#{node['ems-createinstance']['config']['tibemsd_conf_path']}/tibemsd.conf" do
#  owner config_user
#  group config_group
#  mode '0755'
#  content ::File.open("#{ems_conf_templates_dir}/tibemsd.conf").read
#  action :create
# end

ems_install_dir = node['ems-createinstance']['config']['ems_install_dir']
ems_major_version = node['ems-createinstance']['config']['ems_major_version']
ems_conf_templates_dir = "#{ems_install_dir}/ems/#{ems_major_version}/config/templates/conf"
ems_config_home = node['ems-createinstance']['config']['ems_config_home']
ems_instance_name = node['ems-createinstance']['config']['ems_instance_name']
tibemsd_conf_path = "#{ems_config_home}/#{ems_instance_name}/conf"
shared_conf_path = "#{tibemsd_conf_path}/shared"
shared_data_store = "#{shared_conf_path}/datastore"
ems_log_home = node['ems-createinstance']['config']['ems_log_home']
ems_instance_logdir = "#{ems_log_home}/#{ems_instance_name}"
config_group = node['ems-createinstance']['config']['group']
config_user = node['ems-createinstance']['config']['user']

remote_file 'Create copy of tibemsd.conf' do
  path "#{tibemsd_conf_path}/tibemsd.conf"
  source "file://#{ems_conf_templates_dir}/tibemsd.conf"
  owner config_user
  group config_group
  mode '0755'
end

ruby_block 'Find and replce in tibemsd.conf' do
  block do
    tibemsd_conf = Chef::Util::FileEdit.new("#{tibemsd_conf_path}/tibemsd.conf")
    tibemsd_conf.search_file_replace(/EMS-SERVER-NAME/, "#{ems_instance_name}")
    tibemsd_conf.search_file_replace(/SHARED_CONF_PATH/, "#{shared_conf_path}")
    tibemsd_conf.search_file_replace(/DATASTORE_PATH/, "#{shared_data_store}")
    tibemsd_conf.search_file_replace(/TCP_PORT/, "#{node['ems-createinstance']['config']['tcp_port']}")
    tibemsd_conf.search_file_replace(/SSL_PORT/, "#{node['ems-createinstance']['config']['ssl_port']}")
    tibemsd_conf.search_file_replace(/LOG_PATH/, "#{ems_instance_logdir}")
    tibemsd_conf.search_file_replace(/CERT_STORE/, "#{node['ems-createinstance']['config']['cert_store_path']}")
    tibemsd_conf.search_file_replace(/TRUSTED_STORE/, "#{node['ems-createinstance']['config']['trusted_store_path']}")
    tibemsd_conf.search_file_replace(/SERVER_IDENTITY/, "#{node['ems-createinstance']['config']['ssl_server_identity']}")
    tibemsd_conf.search_file_replace(/SERVER_KEY_PASSWORD/, "#{node['ems-createinstance']['config']['ssl_server_key_passwd']}")
    tibemsd_conf.search_file_replace(/SERVER_KEY/, "#{node['ems-createinstance']['config']['ssl_server_key']}")
    tibemsd_conf.search_file_replace(/SERVER_TRUSTED/, "#{node['ems-createinstance']['config']['ssl_server_trusted']}")
    tibemsd_conf.write_file
  end
end

remote_file 'Create copy of acl.conf' do
  path "#{shared_conf_path}/acl.conf"
  source "file://#{ems_conf_templates_dir}/acl.conf"
  owner config_user
  group config_group
  mode '0755'
end

remote_file 'Create copy of bridges.conf' do
  path "#{shared_conf_path}/bridges.conf"
  source "file://#{ems_conf_templates_dir}/bridges.conf"
  owner config_user
  group config_group
  mode '0755'
end

remote_file 'Create copy of channels.conf' do
  path "#{shared_conf_path}/channels.conf"
  source "file://#{ems_conf_templates_dir}/channels.conf"
  owner config_user
  group config_group
  mode '0755'
end

remote_file 'Create copy of durables.conf' do
  path "#{shared_conf_path}/durables.conf"
  source "file://#{ems_conf_templates_dir}/durables.conf"
  owner config_user
  group config_group
  mode '0755'
end

remote_file 'Create copy of factories.conf' do
  path "#{shared_conf_path}/factories.conf"
  source "file://#{ems_conf_templates_dir}/factories.conf"
  owner config_user
  group config_group
  mode '0755'
end

ruby_block 'Find and replce in factories.conf' do
  block do
    tibemsd_conf = Chef::Util::FileEdit.new("#{shared_conf_path}/factories.conf")
    tibemsd_conf.search_file_replace(/TCP_PORT/, "#{node['ems-createinstance']['config']['tcp_port']}")
    tibemsd_conf.search_file_replace(/SSL_PORT/, "#{node['ems-createinstance']['config']['ssl_port']}")
    tibemsd_conf.search_file_replace(/CERT_STORE/, "#{node['ems-createinstance']['config']['cert_store_path']}")
    tibemsd_conf.search_file_replace(/TRUSTED_STORE/, "#{node['ems-createinstance']['config']['trusted_store_path']}")
    tibemsd_conf.write_file
  end
end

remote_file 'Create copy of groups.conf' do
  path "#{shared_conf_path}/groups.conf"
  source "file://#{ems_conf_templates_dir}/groups.conf"
  owner config_user
  group config_group
  mode '0755'
end

remote_file 'Create copy of queues.conf' do
  path "#{shared_conf_path}/queues.conf"
  source "file://#{ems_conf_templates_dir}/queues.conf"
  owner config_user
  group config_group
  mode '0755'
end

remote_file 'Create copy of routes.conf' do
  path "#{shared_conf_path}/routes.conf"
  source "file://#{ems_conf_templates_dir}/routes.conf"
  owner config_user
  group config_group
  mode '0755'
end

remote_file 'Create copy of stores.conf' do
  path "#{shared_conf_path}/stores.conf"
  source "file://#{ems_conf_templates_dir}/stores.conf"
  owner config_user
  group config_group
  mode '0755'
end

remote_file 'Create copy of tibrvcm.conf' do
  path "#{shared_conf_path}/tibrvcm.conf"
  source "file://#{ems_conf_templates_dir}/tibrvcm.conf"
  owner config_user
  group config_group
  mode '0755'
end

remote_file 'Create copy of topics.conf' do
  path "#{shared_conf_path}/topics.conf"
  source "file://#{ems_conf_templates_dir}/topics.conf"
  owner config_user
  group config_group
  mode '0755'
end

remote_file 'Create copy of transports.conf' do
  path "#{shared_conf_path}/transports.conf"
  source "file://#{ems_conf_templates_dir}/transports.conf"
  owner config_user
  group config_group
  mode '0755'
end

remote_file 'Create copy of users.conf' do
  path "#{shared_conf_path}/users.conf"
  source "file://#{ems_conf_templates_dir}/users.conf"
  owner config_user
  group config_group
  mode '0755'
end

ruby_block 'Find and replce in users.conf' do
  block do
    tibemsd_conf = Chef::Util::FileEdit.new("#{shared_conf_path}/users.conf")
    tibemsd_conf.search_file_replace(/EMS-SERVER-NAME/, "#{ems_instance_name}")
    tibemsd_conf.write_file
  end
end

# Change the ownership of the directories
execute 'chown-config-directory' do
  command "chown -R #{config_user}:#{config_group} #{node['ems-createinstance']['config']['tibco_config_home']}"
  user 'root'
  action :run
end
