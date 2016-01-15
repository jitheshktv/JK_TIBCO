#
# Cookbook Name:: createdomain-dbems
# Recipe:: commandfilexml
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#
# Generate the CreateDomain.xml from the template

config_user = node['createdomain-dbems']['config']['user']
config_group = node['createdomain-dbems']['config']['group']
createdomain_cmdfile = node['createdomain-dbems']['config']['createdomain_cmdfile']

template 'CreateDomain.xml' do
  source 'CreateDomain.xml.erb'
  mode '0755'
  path createdomain_cmdfile
end
