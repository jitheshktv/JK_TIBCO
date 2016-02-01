#
# Cookbook Name:: tra-install
# Recipe:: postinstall
#
# Copyright (c) 2016 The Authors, All Rights Reserved.


install_group = node['tra-install']['install']['group']
install_user = node['tra-install']['install']['user']

logs_home_dir = node['tra-install']['install']['logs_home_dir']
logs_temp_dir = "#{logs_home_dir}/tmp"
tra_home_dir = node['tra-install']['install']['tra_home_dir']
logs_home_tra = node['tra-install']['install']['logs_home_tra']
tra_logs = "#{tra_home_dir}/logs"
logs_tra = "#{logs_home_tra}/logs"
appmanage_tra = "#{tra_home_dir}/bin/AppManage.tra"

# Create the logs directory under logs_home_tra.
directory logs_tra do
  owner install_user
  group install_group
  mode '0755'
  recursive true
  action :create
end

# Delete the logs directory under tra_home_dir
directory tra_logs do
  recursive true
  action :delete
end

# Create the softlink
link 'tra logs' do
  to logs_tra
  target_file tra_logs
end

# Add the temp dir to AppManage.tra
regexp_tempdir = "java.property.java.io.tmpdir=#{logs_temp_dir}"
regexp_driversupport = "tibco.env.native.driver.support true"
ruby_block 'Find and replce in tibemsd.conf' do
  block do
    appmanage_tra = Chef::Util::FileEdit.new("#{tra_home_dir}/bin/AppManage.tra")
    appmanage_tra.insert_line_if_no_match(/#{regexp_tempdir}/, "#{regexp_tempdir}")
    appmanage_tra.insert_line_if_no_match(/#{regexp_driversupport}/, "#{regexp_driversupport}")
    appmanage_tra.write_file
  end
end

# Change the ownership of the directories
execute 'chown-logs-directories' do
  command "chown -R #{install_user}:#{install_group} #{logs_home_dir}"
  user 'root'
  action :run
end
