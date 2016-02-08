#
# Cookbook Name:: hawk-install
# Recipe:: install
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#
# Recipe to Install the tibco product using the universal installer and the responsefile
#

hawk_bin_target_path = node['hawk-install']['install']['hawk_bin_target_path']
tibco_universalinstaller_bin = "#{hawk_bin_target_path}/#{node['hawk-install']['install']['tibco_universalinstaller_bin']}"
hawk_install_responsefile = "#{hawk_bin_target_path}/#{node['hawk-install']['install']['response_file']}"
tibhawkhma = "#{node['hawk-install']['install']['hawk_home_dir']}/bin/tibhawkhma"

tibco_install_dir = node['hawk-install']['install']['tibco_install_dir']
install_group = node['hawk-install']['install']['group']
install_user = node['hawk-install']['install']['user']

execute 'install_hawk' do
  command "#{tibco_universalinstaller_bin} -silent -V responseFile=#{hawk_install_responsefile}"
  user install_user
  group install_group
  not_if { File.exist? "#{tibhawkhma}" }
end

# Change the ownership of the directories
execute 'chown-install-directories' do
  command "chown -R #{install_user}:#{install_group} #{tibco_install_dir}"
  user 'root'
  action :run
end

# Clean up the temporary files used for the installation.
directory 'install_bin_file' do
  path hawk_bin_target_path
  recursive true
  action :delete
end