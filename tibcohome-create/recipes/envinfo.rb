#
# Cookbook Name:: tibcohome-create
# Recipe:: envinfo
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

config_user = node['tibcohome-create']['config']['user']
config_group = node['tibcohome-create']['config']['group']
config_user_home = "/home/#{config_user}"
envinfo_dir = "#{config_user_home}/.TIBCOEnvInfo"
envinfo_file = "#{envinfo_dir}/_envInfo.xml"

directory config_user_home do
  recursive true
  owner config_user
  group config_group
  mode '0700'
end

directory envinfo_dir do
  recursive true
  owner config_user
  group config_group
  mode '0755'
end

timestamp_current = Time.now.strftime('%d-%m-%Y.%H%M%S')

template envinfo_file do
  source 'envInfo.xml.erb'
  owner config_user
  group config_group
  mode '0644'
  variables(
    var_timestamp_current:  timestamp_current
  )
end
