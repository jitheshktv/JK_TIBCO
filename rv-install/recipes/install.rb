#
# Cookbook Name:: rv-install
# Recipe:: install
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#
# Recipe to Install the tibco product using the universal installer and the responsefile
#

rv_bin_target_path = node['rv-install']['install']['rv_bin_target_path']
tibco_universalinstaller_bin = "#{rv_bin_target_path}/#{node['rv-install']['install']['tibco_universalinstaller_bin']}"
rv_install_responsefile = "#{rv_bin_target_path}/#{node['rv-install']['install']['response_file']}"
rvd = "#{node['rv-install']['install']['rv_home_dir']}/bin/rvd"

tibco_install_dir = node['rv-install']['install']['tibco_install_dir']
install_group = node['rv-install']['install']['group']
install_user = node['rv-install']['install']['user']

execute 'install_rv' do
  command "#{tibco_universalinstaller_bin} -silent -V responseFile=#{rv_install_responsefile}"
  user install_user
  group install_group
  not_if { File.exist? "#{rvd}" }
end

# Change the ownership of the directories
execute 'chown-install-directories' do
  command "chown -R #{install_user}:#{install_group} #{tibco_install_dir}"
  user 'root'
  action :run
end
