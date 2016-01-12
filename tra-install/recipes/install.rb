#
# Cookbook Name:: tra-install
# Recipe:: install
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#
# Recipe to Install the tibco product using the universal installer and the responsefile
#

tra_bin_target_path = node['tra-install']['install']['tra_bin_target_path']
tibco_universalinstaller_bin = "#{tra_bin_target_path}/#{node['tra-install']['install']['tibco_universalinstaller_bin']}"
tra_install_responsefile = "#{tra_bin_target_path}/#{node['tra-install']['install']['response_file']}"
wrap = "#{node['tra-install']['install']['tra_home_dir']}/bin/wrap"

tibco_install_dir = node['tra-install']['install']['tibco_install_dir']
install_group = node['tra-install']['install']['group']
install_user = node['tra-install']['install']['user']

execute 'install_tra' do
  command "#{tibco_universalinstaller_bin} -silent -V responseFile=#{tra_install_responsefile}"
  not_if { File.exist? "#{wrap}" }
end

# Change the ownership of the directories
execute 'chown-install-directories' do
  command "chown -R #{install_user}:#{install_group} #{tibco_install_dir}"
  user 'root'
  action :run
end
