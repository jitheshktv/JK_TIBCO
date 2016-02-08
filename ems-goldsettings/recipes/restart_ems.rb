bash "kill a process" do
user node['ems-goldsettings']['config']['user']
group node['ems-goldsettings']['config']['group']
code <<-EOH
ps -ef | grep '#{node['ems-goldsettings']['config']['ems_tibemsd']} -config #{node['ems-goldsettings']['config']['ems_config_home']}/#{node['ems-goldsettings']['config']['ems_instance_name']}' | grep -v 'grep ' | awk '{print $2}' | xargs kill
EOH
end

execute 'startemsinstance' do
command "nohup #{node['ems-goldsettings']['config']['ems_tibemsd']} -config #{node['ems-goldsettings']['config']['tibemsd_conf_path']}/tibemsd.conf 2> #{node['ems-goldsettings']['config']['ems_instance_logdir']}/tibems.log 1>&2& >> /dev/null"
user node['ems-goldsettings']['config']['user']
group node['ems-goldsettings']['config']['group']
end
