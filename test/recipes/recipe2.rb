#
# Cookbook Name:: test
# Recipe:: recipe2
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

jk_ln = node[:jk_ln]

file '/tmp/sample_json_coverted1' do
  content lazy{ node[:jk_ln] }
  mode '0777'
end

directory "testing1" do
  path "/tmp/#{jk_ln}/testing_the_JSON"
  recursive true
end
