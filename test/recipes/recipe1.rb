#
# Cookbook Name:: test
# Recipe:: recipe1
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

node.default[:jk_fn] = nil
node.default[:jk_ln] = nil
node.default[:jk_city] = nil

ruby_block 'parse JSON' do
  block do
    json_string = JSON.parse(File.read('/tmp/sample.JSON'))
    node.set[:jk_fn] = json_string['test']['first_name']
    node.set[:jk_ln] = json_string['test']['last_name']
    node.set[:jk_city] = json_string['test']['city']
    print "first name is #{node[:jk_fn]}, last name is #{node[:jk_ln]} and city is #{node[:jk_city]}"
    #file_r = run_context.resource_collection.find(file: '/tmp/sample_json_coverted')
    #file_r.content node[:jk_fn]
  end
end

jk_fn = node[:jk_fn]
jk_ln = node[:jk_ln]
jk_city = node[:jk_city]

file '/tmp/sample_json_coverted' do
  content lazy{ node[:jk_fn] }
  mode '0777'
end

directory "testing" do
  path "/tmp/#{jk_fn}/testing_the_JSON"
  recursive true
end
