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
tibco_install_dir = node['hawk-install']['install']['tibco_install_dir']
hawk_major_version = node['hawk-install']['install']['hawk_major_version']
hawk_home_dir = "#{tibco_install_dir}/hawk/#{hawk_major_version}"
tibhawkhma = "#{hawk_home_dir}/bin/tibhawkhma"

install_group = node['hawk-install']['install']['group']
install_user = node['hawk-install']['install']['user']

# Install the libstdc++ for 32 bit, on 64 bit servers
case node['platform']
when 'redhat', 'centos', 'ubuntu'
  yum_package 'glibc.i686'
  yum_package 'libstdc++.i686'
when 'amazon'
  yum_package 'glibc.i686'
  yum_package 'libstdc++48.i686'
end

execute 'install_hawk' do
  command "#{tibco_universalinstaller_bin} -silent -V responseFile=#{hawk_install_responsefile}"
  cwd hawk_bin_target_path
  user install_user
  group install_group
#  not_if { File.exist? "#{tibhawkhma}" }
end

# Change the ownership of the directories
execute 'chown-install-directories' do
  command "chown -R #{install_user}:#{install_group} #{tibco_install_dir}"
  user 'root'
  action :run
end
