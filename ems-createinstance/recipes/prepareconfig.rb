#
# Cookbook Name:: ems-install
# Recipe:: prepareconfig
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

# Commenting the below as it throws compilation error and the file doesnt created until the ems-install recipe runs.
#file "#{node['ems-createinstance']['config']['tibemsd_conf_path']}/tibemsd.conf" do
#  owner node['ems-createinstance']['config']['user']
#  group node['ems-createinstance']['config']['group']
#  mode '0755'
#  content ::File.open("#{node['ems-createinstance']['config']['ems_conf_templates_dir']}/tibemsd.conf").read
#  action :create
#end

remote_file "Create copy of tibemsd.conf" do
  path "#{node['ems-createinstance']['config']['tibemsd_conf_path']}/tibemsd.conf"
  source "file://#{node['ems-createinstance']['config']['ems_conf_templates_dir']}/tibemsd.conf"
  owner node['ems-createinstance']['config']['user']
  group node['ems-createinstance']['config']['group']
  mode '0755'
end

ruby_block 'Find and replce in tibemsd.conf' do
  block do
    tibemsd_conf = Chef::Util::FileEdit.new("#{node['ems-createinstance']['config']['tibemsd_conf_path']}/tibemsd.conf")
    tibemsd_conf.search_file_replace(/EMS-SERVER-NAME/, "#{node['ems-createinstance']['config']['ems_instance_name']}")
    tibemsd_conf.search_file_replace(/SHARED_CONF_PATH/, "#{node['ems-createinstance']['config']['shared_conf_path']}")
    tibemsd_conf.search_file_replace(/DATASTORE_PATH/, "#{node['ems-createinstance']['config']['shared_data_store']}")
    tibemsd_conf.search_file_replace(/TCP_PORT/, "#{node['ems-createinstance']['config']['tcp_port']}")
    tibemsd_conf.search_file_replace(/SSL_PORT/, "#{node['ems-createinstance']['config']['ssl_port']}")
    tibemsd_conf.search_file_replace(/LOG_PATH/, "#{node['ems-createinstance']['config']['ems_instance_logdir']}")
    tibemsd_conf.search_file_replace(/CERT_STORE/, "#{node['ems-createinstance']['config']['cert_store_path']}")
    tibemsd_conf.search_file_replace(/TRUSTED_STORE/, "#{node['ems-createinstance']['config']['trusted_store_path']}")
    tibemsd_conf.search_file_replace(/SERVER_IDENTITY/, "#{node['ems-createinstance']['config']['ssl_server_identity']}")
    tibemsd_conf.search_file_replace(/SERVER_KEY_PASSWORD/, "#{node['ems-createinstance']['config']['ssl_server_key_passwd']}")
    tibemsd_conf.search_file_replace(/SERVER_KEY/, "#{node['ems-createinstance']['config']['ssl_server_key']}")
    tibemsd_conf.search_file_replace(/SERVER_TRUSTED/, "#{node['ems-createinstance']['config']['ssl_server_trusted']}")
    tibemsd_conf.write_file
  end
end

remote_file "Create copy of acl.conf" do
  path "#{node['ems-createinstance']['config']['shared_conf_path']}/acl.conf"
  source "file://#{node['ems-createinstance']['config']['ems_conf_templates_dir']}/acl.conf"
  owner node['ems-createinstance']['config']['user']
  group node['ems-createinstance']['config']['group']
  mode '0755'
end

remote_file "Create copy of bridges.conf" do
  path "#{node['ems-createinstance']['config']['shared_conf_path']}/bridges.conf"
  source "file://#{node['ems-createinstance']['config']['ems_conf_templates_dir']}/bridges.conf"
  owner node['ems-createinstance']['config']['user']
  group node['ems-createinstance']['config']['group']
  mode '0755'
end

remote_file "Create copy of channels.conf" do
  path "#{node['ems-createinstance']['config']['shared_conf_path']}/channels.conf"
  source "file://#{node['ems-createinstance']['config']['ems_conf_templates_dir']}/channels.conf"
  owner node['ems-createinstance']['config']['user']
  group node['ems-createinstance']['config']['group']
  mode '0755'
end

remote_file "Create copy of durables.conf" do
  path "#{node['ems-createinstance']['config']['shared_conf_path']}/durables.conf"
  source "file://#{node['ems-createinstance']['config']['ems_conf_templates_dir']}/durables.conf"
  owner node['ems-createinstance']['config']['user']
  group node['ems-createinstance']['config']['group']
  mode '0755'
end

remote_file "Create copy of factories.conf" do
  path "#{node['ems-createinstance']['config']['shared_conf_path']}/factories.conf"
  source "file://#{node['ems-createinstance']['config']['ems_conf_templates_dir']}/factories.conf"
  owner node['ems-createinstance']['config']['user']
  group node['ems-createinstance']['config']['group']
  mode '0755'
end

ruby_block 'Find and replce in factories.conf' do
  block do
    tibemsd_conf = Chef::Util::FileEdit.new("#{node['ems-createinstance']['config']['shared_conf_path']}/factories.conf")
    tibemsd_conf.search_file_replace(/TCP_PORT/, "#{node['ems-createinstance']['config']['tcp_port']}")
    tibemsd_conf.search_file_replace(/SSL_PORT/, "#{node['ems-createinstance']['config']['ssl_port']}")
    tibemsd_conf.search_file_replace(/CERT_STORE/, "#{node['ems-createinstance']['config']['cert_store_path']}")
    tibemsd_conf.search_file_replace(/TRUSTED_STORE/, "#{node['ems-createinstance']['config']['trusted_store_path']}")
    tibemsd_conf.write_file
  end
end

remote_file "Create copy of groups.conf" do
  path "#{node['ems-createinstance']['config']['shared_conf_path']}/groups.conf"
  source "file://#{node['ems-createinstance']['config']['ems_conf_templates_dir']}/groups.conf"
  owner node['ems-createinstance']['config']['user']
  group node['ems-createinstance']['config']['group']
  mode '0755'
end

remote_file "Create copy of queues.conf" do
  path "#{node['ems-createinstance']['config']['shared_conf_path']}/queues.conf"
  source "file://#{node['ems-createinstance']['config']['ems_conf_templates_dir']}/queues.conf"
  owner node['ems-createinstance']['config']['user']
  group node['ems-createinstance']['config']['group']
  mode '0755'
end

remote_file "Create copy of routes.conf" do
  path "#{node['ems-createinstance']['config']['shared_conf_path']}/routes.conf"
  source "file://#{node['ems-createinstance']['config']['ems_conf_templates_dir']}/routes.conf"
  owner node['ems-createinstance']['config']['user']
  group node['ems-createinstance']['config']['group']
  mode '0755'
end

remote_file "Create copy of stores.conf" do
  path "#{node['ems-createinstance']['config']['shared_conf_path']}/stores.conf"
  source "file://#{node['ems-createinstance']['config']['ems_conf_templates_dir']}/stores.conf"
  owner node['ems-createinstance']['config']['user']
  group node['ems-createinstance']['config']['group']
  mode '0755'
end

remote_file "Create copy of tibrvcm.conf" do
  path "#{node['ems-createinstance']['config']['shared_conf_path']}/tibrvcm.conf"
  source "file://#{node['ems-createinstance']['config']['ems_conf_templates_dir']}/tibrvcm.conf"
  owner node['ems-createinstance']['config']['user']
  group node['ems-createinstance']['config']['group']
  mode '0755'
end

remote_file "Create copy of topics.conf" do
  path "#{node['ems-createinstance']['config']['shared_conf_path']}/topics.conf"
  source "file://#{node['ems-createinstance']['config']['ems_conf_templates_dir']}/topics.conf"
  owner node['ems-createinstance']['config']['user']
  group node['ems-createinstance']['config']['group']
  mode '0755'
end

remote_file "Create copy of transports.conf" do
  path "#{node['ems-createinstance']['config']['shared_conf_path']}/transports.conf"
  source "file://#{node['ems-createinstance']['config']['ems_conf_templates_dir']}/transports.conf"
  owner node['ems-createinstance']['config']['user']
  group node['ems-createinstance']['config']['group']
  mode '0755'
end

remote_file "Create copy of users.conf" do
  path "#{node['ems-createinstance']['config']['shared_conf_path']}/users.conf"
  source "file://#{node['ems-createinstance']['config']['ems_conf_templates_dir']}/users.conf"
  owner node['ems-createinstance']['config']['user']
  group node['ems-createinstance']['config']['group']
  mode '0755'
end

ruby_block 'Find and replce in users.conf' do
  block do
    tibemsd_conf = Chef::Util::FileEdit.new("#{node['ems-createinstance']['config']['shared_conf_path']}/users.conf")
    tibemsd_conf.search_file_replace(/EMS-SERVER-NAME/, "#{node['ems-createinstance']['config']['ems_instance_name']}")
    tibemsd_conf.write_file
  end
end

# Change the ownership of the directories
execute 'chown-config-directory' do
  command "chown -R #{node['ems-createinstance']['config']['user']}:#{node['ems-createinstance']['config']['group']} #{node['ems-createinstance']['config']['tibco_config_home']}"
  user 'root'
  action :run
end
