# variables
config_user = node['ems-goldsettings']['config']['user']
config_group = node['ems-goldsettings']['config']['group']

ems_install_dir = node['ems-goldsettings']['config']['ems_install_dir']
ems_major_version = node['ems-goldsettings']['config']['ems_major_version']
ems_tibemsd64 = "#{ems_install_dir}/ems/#{ems_major_version}/bin/tibemsd64"
ems_config_home = node['ems-goldsettings']['config']['ems_config_home']
ems_instance_name = node['ems-goldsettings']['config']['ems_instance_name']
ems_log_home = node['ems-goldsettings']['config']['ems_log_home']
ems_instance_logdir = "#{ems_log_home}/#{ems_instance_name}"
tibemsd_conf_path = "#{ems_config_home}/#{ems_instance_name}/conf"

# Stop ems instance
execute 'stop ems instance' do
  user config_user
  group config_group
  command "ps -ef | grep '#{ems_tibemsd64} -config #{tibemsd_conf_path}' | grep -v 'grep ' | awk '{print $2}' | xargs kill"
end

# Start ems instance
execute 'start ems instance' do
  user config_user
  group config_group
  command "nohup #{ems_tibemsd64} -config #{tibemsd_conf_path}/tibemsd.conf 2> #{ems_instance_logdir}/tibems.log 1>&2& >> /dev/null"
end
