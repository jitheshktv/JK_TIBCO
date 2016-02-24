#
# Cookbook Name:: rv-install
# Recipe:: responsefile
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#
# recipe to create the responsefile for the silent mode installation.
#

rv_bin_target_path = node['rv-install']['install']['rv_bin_target_path']
rv_install_responsefile = "#{rv_bin_target_path}/#{node['rv-install']['install']['response_file']}"

config_user = node['rv-install']['config']['user']
config_user_home = "/home/#{config_user}"
envinfo_dir = "#{config_user_home}/.TIBCOEnvInfo"
envinfo_file = "#{envinfo_dir}/_envInfo.xml"
tibco_home_name = node['rv-install']['install']['tibco_home_name']
node.default[:createnewenvt] = nil

ruby_block 'check if TIBCOEnvInfo exists' do
  block do
    if File.readlines(envinfo_file).grep(/"#{tibco_home_name}"/).size > 0
      node.set[:createnewenvt] = 'false'
    else
      node.set[:createnewenvt] = 'true'
    end
  end
  only_if { File.exist?(envinfo_file) }
end

template rv_install_responsefile do
  source 'TIBCOInstallResponsefile-rv.silent.erb'
  mode '0755'
  variables(
    var_createnewenvt:  node[:createnewenvt]
  )
end
