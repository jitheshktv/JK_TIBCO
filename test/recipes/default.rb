#
# Cookbook Name:: test
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

file '/tmp/testing_platform' do
  content node['platform']
  mode '0777'
end

file '/tmp/testing_architecture' do
  content node['kernel']['machine']
  mode '0777'
end
