#
# Cookbook Name:: tibcoadmin-install
# Recipe:: install
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#
# Recipe to Install the tibco product using the universal installer and the responsefile
#

tibcoadmin_bin_target_path = node['tibcoadmin-install']['install']['tibcoadmin_bin_target_path']
tibco_universalinstaller_bin = "#{tibcoadmin_bin_target_path}/#{node['tibcoadmin-install']['install']['tibco_universalinstaller_bin']}"
tibcoadmin_install_responsefile = "#{tibcoadmin_bin_target_path}/#{node['tibcoadmin-install']['install']['response_file']}"
uninstall_admin = "#{node['tibcoadmin-install']['install']['tibcoadmin_home_dir']}/bin/uninstall_admin"

tibco_install_dir = node['tibcoadmin-install']['install']['tibco_install_dir']
install_group = node['tibcoadmin-install']['install']['group']
install_user = node['tibcoadmin-install']['install']['user']

execute 'install_tibcoadmin' do
  command "#{tibco_universalinstaller_bin} -silent -V responseFile=#{tibcoadmin_install_responsefile}"
  user install_user
  group install_group
  not_if { File.exist? "#{uninstall_admin}" }
end

# Change the ownership of the directories
execute 'chown-install-directories' do
  command "chown -R #{install_user}:#{install_group} #{tibco_install_dir}"
  user 'root'
  action :run
end

#Clean up the temporary files used for the installation.
directory 'install_bin_file' do
  path tibcoadmin_bin_target_path
  recursive true
  action :delete
end
