#
# Cookbook Name:: jmsclient-install
# Recipe:: installclient
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

s3_bucket = node['jmsclient-install']['config']['s3_bucket']
ems_client_version = node['jmsclient-install']['config']['ems_client_version']
ems_client_s3_url = "#{s3_bucket}/ems-client-#{ems_client_version}.zip"
temp_file = "/tmp/ems-client-#{ems_client_version}.zip"

config_user = node['jmsclient-install']['config']['user']
config_group = node['jmsclient-install']['config']['group']
tibco_install_dir = node['jmsclient-install']['config']['tibco_install_dir']
tra_version = node['jmsclient-install']['config']['tra_version']
tra_lib_dir = "#{tibco_install_dir}/tra/#{tra_version}/lib"

# Download the file from S3
remote_file temp_file do
  source ems_client_s3_url
  owner config_user
  group config_group
  mode '0755'
end

# Install the unzip package
package 'unzip'

# Unzip the downloaded file to tra lib direcrory
execute 'unzip_tempfile' do
  command "unzip -o #{temp_file}"
  cwd tra_lib_dir
end

# Change the ownership of thetra lib files
execute 'chown-install-directories' do
  command "chown -R #{config_user}:#{config_group} #{tra_lib_dir}"
  user 'root'
  action :run
end

# Change the premissions of the tra lib files
execute 'chown-install-directories' do
  command "chmod -R 755 #{tra_lib_dir}"
  user 'root'
  action :run
end

# delete the temporay file
file temp_file do
  action :delete
end
