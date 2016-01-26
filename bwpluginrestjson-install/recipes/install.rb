#
# Cookbook Name:: bwpluginrestjson-install
# Recipe:: install
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#
# Recipe to Install the tibco product using the universal installer and the responsefile
#

bwpluginrestjson_bin_target_path = node['bwpluginrestjson-install']['install']['bwpluginrestjson_bin_target_path']
tibco_universalinstaller_bin = "#{bwpluginrestjson_bin_target_path}/#{node['bwpluginrestjson-install']['install']['tibco_universalinstaller_bin']}"
bwpluginrestjson_install_responsefile = "#{bwpluginrestjson_bin_target_path}/#{node['bwpluginrestjson-install']['install']['response_file']}"
restjsonplugin_jar = node['bwpluginrestjson-install']['install']['restjsonplugin_jar']

tibco_install_dir = node['bwpluginrestjson-install']['install']['tibco_install_dir']
install_group = node['bwpluginrestjson-install']['install']['group']
install_user = node['bwpluginrestjson-install']['install']['user']

execute 'install_bwpluginrestjson' do
  command "#{tibco_universalinstaller_bin} -silent -V responseFile=#{bwpluginrestjson_install_responsefile}"
  user install_user
  group install_group
  not_if { File.exist? "#{restjsonplugin_jar}" }
end

# Change the ownership of the directories
execute 'chown-install-directories' do
  command "chown -R #{install_user}:#{install_group} #{tibco_install_dir}"
  user 'root'
  action :run
end

#Clean up the temporary files used for the installation.
directory 'install_bin_file' do
  path bwpluginrestjson_bin_target_path
  recursive true
  action :delete
end
