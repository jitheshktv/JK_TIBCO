#
# Cookbook Name:: sdk-install
# Recipe:: install
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#
# Recipe to Install the tibco product using the universal installer and the responsefile
#

sdk_bin_target_path = node['sdk-install']['install']['sdk_bin_target_path']
tibco_installer = "#{sdk_bin_target_path}/#{node['sdk-install']['install']['tibco_universalinstaller_bin']}"
sdk_install_responsefile = "#{sdk_bin_target_path}/#{node['sdk-install']['install']['response_file']}"

tibco_install_dir = node['sdk-install']['install']['tibco_install_dir']
sdk_major_version = node['sdk-install']['install']['sdk_major_version']
sdk_home_dir = "#{tibco_install_dir}/adapter/sdk/#{sdk_major_version}"
adaptersdk = "#{sdk_home_dir}/bin/aesend"

install_group = node['sdk-install']['install']['group']
install_user = node['sdk-install']['install']['user']

# Install bc utility
yum_package 'bc'

# Install the libstdc++ for 32 bit, on 64 bit servers
case node['platform']
when 'redhat', 'centos', 'ubuntu'
  yum_package 'libstdc++.i686'
when 'amazon'
  yum_package 'libstdc++48.i686'
end

if tibco_installer.include? "TIBCOUniversalInstaller"
  execute 'install_sdk' do
    command "#{tibco_installer} -silent -V responseFile=#{sdk_install_responsefile}"
    cwd sdk_bin_target_path
    user install_user
    group install_group
    not_if { File.exist? "#{adaptersdk}" }
  end
else
  execute 'install_sdk' do
    command "#{tibco_installer} -silent"
    cwd sdk_bin_target_path
    user install_user
    group install_group
    not_if { File.exist? "#{adaptersdk}" }
  end
end

# Change the ownership of the directories
execute 'chown-install-directories' do
  command "chown -R #{install_user}:#{install_group} #{tibco_install_dir}"
  user 'root'
  action :run
end
