#
# Cookbook Name:: tra-install
# Recipe:: postinstall
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

# The recipe to perform some post installation operations.

install_group = node['tra-install']['install']['group']
install_user = node['tra-install']['install']['user']

tibco_install_dir = node['tra-install']['install']['tibco_install_dir']
logs_home_dir = node['tra-install']['install']['logs_home_dir']
# logs_temp_dir = node['tra-install']['install']['logs_temp_dir']
tra_version = node['tra-install']['install']['tra_version']
tra_home_dir = "#{tibco_install_dir}/tra/#{tra_version}"
logs_home_tra = "#{logs_home_dir}/tra/#{tra_version}"

tra_logs = "#{tra_home_dir}/logs"
logs_tra = "#{logs_home_tra}/logs"

appmanage_tra = "#{tra_home_dir}/bin/AppManage.tra"
ae2xsd_tra = "#{tra_home_dir}/bin/ae2xsd.tra"
appstatuscheck_tra = "#{tra_home_dir}/bin/AppStatusCheck.tra"
buildear_tra = "#{tra_home_dir}/bin/buildear.tra"
corprolesynchronizer_tra = "#{tra_home_dir}/bin/CorpRoleSynchronizer.tra"
corpusersynchronizer_tra = "#{tra_home_dir}/bin/CorpUserSynchronizer.tra"
deleteinvalidusers_tra = "#{tra_home_dir}/bin/DeleteInvalidUsers.tra"
domainutility_tra = "#{tra_home_dir}/bin/domainutility.tra"
domainutilitycmd_tra = "#{tra_home_dir}/bin/domainutilitycmd.tra"
exportdomainsecurity_tra = "#{tra_home_dir}/bin/ExportDomainSecurity.tra"
importdomainsecurity_tra = "#{tra_home_dir}/bin/ImportDomainSecurity.tra"
movemachine_tra = "#{tra_home_dir}/bin/MoveMachine.tra"
muilangchooser_tra = "#{tra_home_dir}/bin/MUILangChooser.tra"
obfuscate_tra = "#{tra_home_dir}/bin/obfuscate.tra"
redeployallappsforuser_tra = "#{tra_home_dir}/bin/RedeployAllAppsForUser.tra"
repoconvert_tra = "#{tra_home_dir}/bin/RepoConvert.tra"
repocreateinstance_tra = "#{tra_home_dir}/bin/RepoCreateInstance.tra"
repodelete_tra = "#{tra_home_dir}/bin/RepoDelete.tra"
repodeleteinstance_tra = "#{tra_home_dir}/bin/RepoDeleteInstance.tra"
repodiff_tra = "#{tra_home_dir}/bin/RepoDiff.tra"
repoexport_tra = "#{tra_home_dir}/bin/RepoExport.tra"
repoimport_tra = "#{tra_home_dir}/bin/RepoImport.tra"
repolistinstances_tra = "#{tra_home_dir}/bin/RepoListInstances.tra"
repoping_tra = "#{tra_home_dir}/bin/RepoPing.tra"
reporename_tra = "#{tra_home_dir}/bin/RepoRename.tra"
seed_tra = "#{tra_home_dir}/bin/seed.tra"
tra_tra = "#{tra_home_dir}/bin/tra.tra"
traDBConfig_tra = "#{tra_home_dir}/bin/traDBConfig.tra"
tramodify_tra = "#{tra_home_dir}/bin/tramodify.tra"
traUpgradeManager_tra = "#{tra_home_dir}/bin/traUpgradeManager.tra"

# Create the logs directory under logs_home_tra.
directory logs_tra do
  owner install_user
  group install_group
  mode '0755'
  recursive true
  action :create
end

# Delete the logs directory under tra_home_dir
directory tra_logs do
  recursive true
  action :delete
end

# Create the softlink
link 'tra logs' do
  to logs_tra
  target_file tra_logs
end

# The below code is now replaced using template resource
# Add the temp dir to AppManage.tra
# regexp_tempdir = "java.property.java.io.tmpdir=#{logs_temp_dir}"
# regexp_driversupport = "tibco.env.native.driver.support=true"
# ruby_block 'Find and replce in tibemsd.conf' do
#   block do
#     appmanage_tra = Chef::Util::FileEdit.new("#{tra_home_dir}/bin/AppManage.tra")
#     appmanage_tra.insert_line_if_no_match(/#{regexp_tempdir}/, "#{regexp_tempdir}")
#     appmanage_tra.insert_line_if_no_match(/#{regexp_driversupport}/, "#{regexp_driversupport}")
#     appmanage_tra.write_file
#   end
# end

# JK - version 0.1.1 - The above ruby_block code has been replaced with template.

template appmanage_tra do
  source 'AppManage.tra.erb'
  path appmanage_tra
  mode '0644'
end

template ae2xsd_tra do
  source 'ae2xsd.tra.erb'
  path ae2xsd_tra
  mode '0644'
end

template appstatuscheck_tra do
  source 'AppStatusCheck.tra.erb'
  path appstatuscheck_tra
  mode '0644'
end

template buildear_tra do
  source 'buildear.tra.erb'
  path buildear_tra
  mode '0644'
end

template corprolesynchronizer_tra do
  source 'CorpRoleSynchronizer.tra.erb'
  path corprolesynchronizer_tra
  mode '0644'
end

template corpusersynchronizer_tra do
  source 'CorpUserSynchronizer.tra.erb'
  path corpusersynchronizer_tra
  mode '0644'
end

template deleteinvalidusers_tra do
  source 'DeleteInvalidUsers.tra.erb'
  path deleteinvalidusers_tra
  mode '0644'
end

template domainutility_tra do
  source 'domainutility.tra.erb'
  path domainutility_tra
  mode '0644'
end

template domainutilitycmd_tra do
  source 'domainutilitycmd.tra.erb'
  path domainutilitycmd_tra
  mode '0644'
end

template exportdomainsecurity_tra do
  source 'ExportDomainSecurity.tra.erb'
  path exportdomainsecurity_tra
  mode '0644'
end

template importdomainsecurity_tra do
  source 'ImportDomainSecurity.tra.erb'
  path importdomainsecurity_tra
  mode '0644'
end

template movemachine_tra do
  source 'MoveMachine.tra.erb'
  path movemachine_tra
  mode '0644'
end

template muilangchooser_tra do
  source 'MUILangChooser.tra.erb'
  path muilangchooser_tra
  mode '0644'
end

template obfuscate_tra do
  source 'obfuscate.tra.erb'
  path obfuscate_tra
  mode '0644'
end

template redeployallappsforuser_tra do
  source 'RedeployAllAppsForUser.tra.erb'
  path redeployallappsforuser_tra
  mode '0644'
end

template repoconvert_tra do
  source 'RepoConvert.tra.erb'
  path repoconvert_tra
  mode '0644'
end

template repocreateinstance_tra do
  source 'RepoCreateInstance.tra.erb'
  path repocreateinstance_tra
  mode '0644'
end

template repodelete_tra do
  source 'RepoDelete.tra.erb'
  path repodelete_tra
  mode '0644'
end

template repodeleteinstance_tra do
  source 'RepoDeleteInstance.tra.erb'
  path repodeleteinstance_tra
  mode '0644'
end

template repodiff_tra do
  source 'RepoDiff.tra.erb'
  path repodiff_tra
  mode '0644'
end

template repoexport_tra do
  source 'RepoExport.tra.erb'
  path repoexport_tra
  mode '0644'
end

template repoimport_tra do
  source 'RepoImport.tra.erb'
  path repoimport_tra
  mode '0644'
end

template repolistinstances_tra do
  source 'RepoListInstances.tra.erb'
  path repolistinstances_tra
  mode '0644'
end

template repoping_tra do
  source 'RepoPing.tra.erb'
  path repoping_tra
  mode '0644'
end

template reporename_tra do
  source 'RepoRename.tra.erb'
  path reporename_tra
  mode '0644'
end

template seed_tra do
  source 'seed.tra.erb'
  path seed_tra
  mode '0644'
end

template tra_tra do
  source 'tra.tra.erb'
  path tra_tra
  mode '0644'
end

template traDBConfig_tra do
  source 'traDBConfig.tra.erb'
  path traDBConfig_tra
  mode '0644'
end

template tramodify_tra do
  source 'tramodify.tra.erb'
  path tramodify_tra
  mode '0644'
end

template traUpgradeManager_tra do
  source 'traUpgradeManager.tra.erb'
  path traUpgradeManager_tra
  mode '0644'
end

# Change the ownership of the directories
execute 'chown-logs-directories' do
  command "chown -R #{install_user}:#{install_group} #{logs_home_dir}"
  user 'root'
  action :run
end
