#
# Cookbook Name:: bwplugincopybook-install
# Recipe:: install
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#
# Recipe to Install the tibco product using the universal installer and the responsefile
#

bwplugincopybook_bin_target_path = node['bwplugincopybook-install']['install']['bwplugincopybook_bin_target_path']
tibco_universalinstaller_bin = "#{bwplugincopybook_bin_target_path}/#{node['bwplugincopybook-install']['install']['tibco_universalinstaller_bin']}"
bwplugincopybook_install_responsefile = "#{bwplugincopybook_bin_target_path}/#{node['bwplugincopybook-install']['install']['response_file']}"

tibco_install_dir = node['bwplugincopybook-install']['install']['tibco_install_dir']
copybook_jar = "#{tibco_install_dir}/bw/plugins/lib/palettes/copybook.jar"
install_group = node['bwplugincopybook-install']['install']['group']
install_user = node['bwplugincopybook-install']['install']['user']

execute 'install_bwplugincopybook' do
  command "#{tibco_universalinstaller_bin} -silent -V responseFile=#{bwplugincopybook_install_responsefile}"
  cwd bwplugincopybook_bin_target_path
  user install_user
  group install_group
  not_if { File.exist? "#{copybook_jar}" }
end

# Change the ownership of the directories
execute 'chown-install-directories' do
  command "chown -R #{install_user}:#{install_group} #{tibco_install_dir}"
  user 'root'
  action :run
end

# Clean up the temporary files used for the installation.
directory 'install_bin_file' do
  path bwplugincopybook_bin_target_path
  recursive true
  action :delete
end
