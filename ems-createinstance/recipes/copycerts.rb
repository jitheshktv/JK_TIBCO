#
# Cookbook Name:: ems-createinstance
# Recipe:: copycerts
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

# Copy certificates from S3 to local machine.

cert_s3_bucket = node['ems-createinstance']['config']['cert_s3_bucket']
cert_store_path = node['ems-createinstance']['config']['cert_store_path']
trusted_store_path = node['ems-createinstance']['config']['trusted_store_path']

ssl_server_identity  = node['ems-createinstance']['config']['ssl_server_identity']
ssl_server_key = node['ems-createinstance']['config']['ssl_server_key']
ssl_server_trusted = node['ems-createinstance']['config']['ssl_server_trusted']

s3_ssl_server_identity = "#{cert_s3_bucket}/#{ssl_server_identity}"
s3_ssl_server_key = "#{cert_s3_bucket}/#{ssl_server_key}"
s3_ssl_server_trusted = "#{cert_s3_bucket}/#{ssl_server_trusted}"

local_ssl_server_identity = "#{cert_store_path}/#{ssl_server_identity}"
local_ssl_server_key = "#{cert_store_path}/#{ssl_server_key}"
local_ssl_server_trusted = "#{trusted_store_path}/#{ssl_server_trusted}"

config_user = node['ems-createinstance']['config']['user']
config_group = node['ems-createinstance']['config']['group']

# Download the file from S3
remote_file local_ssl_server_key do
  source s3_ssl_server_key
  owner config_user
  group config_group
  mode '0755'
end

remote_file local_ssl_server_identity do
  source s3_ssl_server_identity
  owner config_user
  group config_group
  mode '0755'
end

remote_file local_ssl_server_trusted do
  source s3_ssl_server_trusted
  owner config_user
  group config_group
  mode '0755'
end
