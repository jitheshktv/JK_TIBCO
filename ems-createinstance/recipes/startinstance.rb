#
# Cookbook Name:: ems-createinstance
# Recipe:: startinstance
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
ems_install_dir = node['ems-createinstance']['config']['ems_install_dir']
ems_major_version = node['ems-createinstance']['config']['ems_major_version']
ems_tibemsd64 = "#{ems_install_dir}/ems/#{ems_major_version}/bin/tibemsd64"
ems_config_home = node['ems-createinstance']['config']['ems_config_home']
ems_instance_name = node['ems-createinstance']['config']['ems_instance_name']
tibemsd_conf_path = "#{ems_config_home}/#{ems_instance_name}/conf"
ems_log_home = node['ems-createinstance']['config']['ems_log_home']
ems_instance_logdir = "#{ems_log_home}/#{ems_instance_name}"

execute 'startemsinstance' do
  command "nohup #{ems_tibemsd64} -config #{tibemsd_conf_path}/tibemsd.conf 2> #{ems_instance_logdir}/tibems.log 1>&2& >> /dev/null"
  user node['ems-createinstance']['config']['user']
  group node['ems-createinstance']['config']['group']
end
