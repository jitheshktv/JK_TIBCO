#
# Cookbook Name:: test
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
fname = node['test']['first_name']
lname = node['test']['last_name']
city1 = node['test']['city']

file '/tmp/testing_platform' do
  content node['platform']
  mode '0777'
end

file '/tmp/testing_architecture' do
  content node['kernel']['machine']
  mode '0777'
end

file '/tmp/sample.JSON' do
  content "{ \"test\" : { \"first_name\" : \"#{fname}\", \"last_name\" : \"#{lname}\", \"city\" : \"#{city1}\"}}"
  mode '0777'
end

y = node['test']['x'] + 100
file '/tmp/math' do
  content "value of y is #{y}"
  mode '0777'
end
