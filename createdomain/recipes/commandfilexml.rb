#
# Cookbook Name:: createdomain
# Recipe:: commandfilexml
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#
# Generate the CreateDomain.xml from the template

config_user = node['createdomain-rv']['config']['user']
config_group = node['createdomain-rv']['config']['group']
createdomain_xml = '/tmp/CreateDomain.xml'

template 'CreateDomain.xml' do
  source 'CreateDomain.xml.erb'
  mode '0755'
  path createdomain_xml
end
