#
# Cookbook Name:: bw-install
# Recipe:: install
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#
# Recipe to Install the tibco product using the universal installer and the responsefile
#

bw_bin_target_path = node['bw-install']['install']['bw_bin_target_path']
tibco_universalinstaller_bin = "#{bw_bin_target_path}/#{node['bw-install']['install']['tibco_universalinstaller_bin']}"
bw_install_responsefile = "#{bw_bin_target_path}/#{node['bw-install']['install']['response_file']}"
bwengine = "#{node['bw-install']['install']['bw_home_dir']}/bin/bwengine"

tibco_install_dir = node['bw-install']['install']['tibco_install_dir']
install_group = node['bw-install']['install']['group']
install_user = node['bw-install']['install']['user']

execute 'install_bw' do
  command "#{tibco_universalinstaller_bin} -silent -V responseFile=#{bw_install_responsefile}"
  user install_user
  group install_group
  not_if { File.exist? "#{bwengine}" }
end

# Change the ownership of the directories
execute 'chown-install-directories' do
  command "chown -R #{install_user}:#{install_group} #{tibco_install_dir}"
  user 'root'
  action :run
end

#Clean up the temporary files used for the installation.
directory 'install_bin_file' do
  path bw_bin_target_path
  recursive true
  action :delete
end
