#
# Cookbook Name:: sdk-install
# Recipe:: install
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#
# Recipe to Install the tibco product using the universal installer and the responsefile
#

sdk_bin_target_path = node['sdk-install']['install']['sdk_bin_target_path']
tibco_universalinstaller_bin = "#{sdk_bin_target_path}/#{node['sdk-install']['install']['tibco_universalinstaller_bin']}"
sdk_install_responsefile = "#{sdk_bin_target_path}/#{node['sdk-install']['install']['response_file']}"
adaptersdk = "#{node['sdk-install']['install']['sdk_home_dir']}/bin/bwengine"

tibco_install_dir = node['sdk-install']['install']['tibco_install_dir']
install_group = node['sdk-install']['install']['group']
install_user = node['sdk-install']['install']['user']

# Install the required yum packages for running 32 bit domainutility on a 64 bit OS arch
yum_package 'glibc.i686'
yum_package 'libstdc++48.i686'

execute 'install_sdk' do
  command "#{tibco_universalinstaller_bin} -silent -V responseFile=#{sdk_install_responsefile}"
  user install_user
  group install_group
  not_if { File.exist? "#{adaptersdk}" }
end

# Change the ownership of the directories
execute 'chown-install-directories' do
  command "chown -R #{install_user}:#{install_group} #{tibco_install_dir}"
  user 'root'
  action :run
end

#Clean up the temporary files used for the installation.
directory 'install_bin_file' do
  path sdk_bin_target_path
  recursive true
  action :delete
end
