#
# Cookbook Name:: ems-install
# Recipe:: responsefile
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

# recipe to create the response file for the EMS installation

ems_bin_target_path = node['ems-install']['install']['ems_bin_target_path']
ems_install_responsefile = "#{ems_bin_target_path}/#{node['ems-install']['install']['response_file']}"

# config_user = node['ems-install']['install']['user']
# config_user_home = "/home/#{config_user}"
# envinfo_dir = "#{config_user_home}/.TIBCOEnvInfo"
# envinfo_file = "#{envinfo_dir}/_envInfo.xml"
# tibco_home_name = node['ems-install']['install']['tibco_home_name']
# node.default[:createnewenvt] = nil

# ruby_block 'check if TIBCOEnvInfo exists' do
#   block do
#     if File.readlines(envinfo_file).grep(/"#{tibco_home_name}"/).size > 0
#       node.set[:createnewenvt] = 'false'
#     else
#       node.set[:createnewenvt] = 'true'
#     end
#   end
#   only_if { File.exist?(envinfo_file) }
# end

template ems_install_responsefile do
  source 'emsInstallResponsefile.silent.erb'
  mode '0755'
#   variables(
#     var_createnewenvt:  node[:createnewenvt]
#   )
end
