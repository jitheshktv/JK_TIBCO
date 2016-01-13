#
# Cookbook Name:: ems-install
# Recipe:: s3download
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
ems_bin_target_path = node['ems-install']['install']['ems_bin_target_path']
ems_bin_zip = node['ems-install']['install']['linux_bin_zip']
ems_bin_target = "#{ems_bin_target_path}/#{ems_bin_zip}"
ems_bin_source = node['ems-install']['install']['linux_bin_source']
ems_bin = node['ems-install']['install']['linux_bin']
group_name = node['ems-install']['install']['group']
user_name = node['ems-install']['install']['user']
ems_install_dir = node['ems-install']['install']['ems_install_dir']

# create the required directories
directory ems_bin_target_path do
  owner user_name
  group group_name
  mode '0777'
end

# Download the file from S3
remote_file ems_bin_target do
  source ems_bin_source
  owner user_name
  group group_name
  mode '0777'
end

# Install the unzip package
package 'unzip'

# Unzip the binary zip file
execute 'unzip_bin_zip' do
  command "unzip #{ems_bin_target}"
  cwd ems_bin_target_path
  user user_name
  group group_name
  not_if { File.exist? "#{ems_bin_target_path}/#{ems_bin}" }
end

# Change the ownership of the binary
file "#{ems_bin_target_path}/#{ems_bin}" do
  mode '0755'
end

# Change the ownership of the directories. The installation will fail if the user doesnt have write access to the installation directory.
execute 'chown-ems-files' do
  command "chown -R #{user_name}:#{group_name} #{ems_install_dir}"
  user 'root'
  action :run
end
