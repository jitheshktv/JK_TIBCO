#
# Cookbook Name:: createdomain
# Recipe:: commandfilexml
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#
# Generate the CreateDomain.xml from the template

createdomain_cmdfile = node['createdomain-rv']['config']['createdomain_cmdfile']

template 'CreateDomain.xml' do
  source 'CreateDomain.xml.erb'
  mode '0755'
  path createdomain_cmdfile
end
