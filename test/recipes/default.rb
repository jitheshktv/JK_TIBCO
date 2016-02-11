#
# Cookbook Name:: test
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

explicit_rvinstall_needed = node['rv-install']['install']['explicit_rvinstall_needed']

if explicit_rvinstall_needed == 'true'
  file '/tmp/tesing' do
    content node['platform']
    mode '0777'
  end
end
