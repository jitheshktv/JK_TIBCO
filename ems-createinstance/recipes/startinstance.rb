#
# Cookbook Name:: ems-createinstance
# Recipe:: startinstance
#
# Copyright (c) 2015 The Authors, All Rights Reserved.


execute 'startemsinstance' do
  command "nohup #{node['ems-createinstance']['config']['ems_tibemsd']} -config #{node['ems-createinstance']['config']['tibemsd_conf_path']}/tibemsd.conf 2> #{node['ems-createinstance']['config']['ems_instance_logdir']}/tibems.log 1>&2& >> /dev/null"
  user node['ems-createinstance']['config']['user']
  group node['ems-createinstance']['config']['group']
end
