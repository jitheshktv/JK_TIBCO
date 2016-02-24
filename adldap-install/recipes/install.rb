#
# Cookbook Name:: adldap-install
# Recipe:: install
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#
# Recipe to Install the tibco product using the universal installer and the responsefile
#

adldap_bin_target_path = node['adldap-install']['install']['adldap_bin_target_path']
tibco_installer = "#{adldap_bin_target_path}/#{node['adldap-install']['install']['tibco_universalinstaller_bin']}"
adldap_install_responsefile = "#{adldap_bin_target_path}/#{node['adldap-install']['install']['response_file']}"

tibco_install_dir = node['adldap-install']['install']['tibco_install_dir']
adldap_major_version = node['adldap-install']['install']['adldap_major_version']
adldap_home_dir = "#{tibco_install_dir}/adapter/adldap/#{adldap_major_version}"
adldap = "#{adldap_home_dir}/bin/adldap"

install_group = node['adldap-install']['install']['group']
install_user = node['adldap-install']['install']['user']

if tibco_installer.include? "TIBCOUniversalInstaller"
  execute 'install_adldap' do
    command "#{tibco_installer} -silent -V responseFile=#{adldap_install_responsefile}"
    cwd adldap_bin_target_path
    user install_user
    group install_group
    not_if { File.exist? "#{adldap}" }
  end
else
  execute 'install_adldap' do
    command "#{tibco_installer} -silent"
    cwd adldap_bin_target_path
    user install_user
    group install_group
    not_if { File.exist? "#{adldap}" }
  end
end

# Change the ownership of the directories
execute 'chown-install-directories' do
  command "chown -R #{install_user}:#{install_group} #{tibco_install_dir}"
  user 'root'
  action :run
end

# Clean up the temporary files used for the installation.
directory 'install_bin_file' do
  path adldap_bin_target_path
  recursive true
  action :delete
end
