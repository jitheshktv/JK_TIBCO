# variables
config_user = node['ems-goldsettings']['config']['user']
config_group = node['ems-goldsettings']['config']['group']

ems_config_home = node['ems-goldsettings']['config']['ems_config_home']
ems_instance_name = node['ems-goldsettings']['config']['ems_instance_name']
shared_conf_path = "#{ems_config_home}/#{ems_instance_name}/conf/shared"
factories_conf = "#{shared_conf_path}/factories.conf"

# Create a copy of factories.conf file with timestamp
timestamp = Time.new.strftime('%F-%T')
remote_file 'Backup of factories.conf file' do
  path "#{factories_conf}_#{timestamp}"
  source "file://#{factories_conf}"
  owner config_user
  group config_group
  mode '0755'
end

# Update the factories.conf gold setting values using template
template "#{factories_conf}" do
  source 'factories.conf.erb'
  owner config_user
  group config_group
  mode '0755'
end
