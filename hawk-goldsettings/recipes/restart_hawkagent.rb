config_user = node['hawk-goldsettings']['config']['user']
config_group = node['hawk-goldsettings']['config']['group']
tra_domainhome_dir = node['hawk-goldsettings']['config']['tra_domainhome_dir']
domain_name = node['hawk-goldsettings']['config']['domain_name']
tra_domain_dir = "#{tra_domainhome_dir}/#{domain_name}"
hawkagent = "#{tra_domain_dir}/hawkagent_#{domain_name}"

bash "stop_hawkagent" do
user config_user
group config_group
code <<-EOH
ps -eaf | grep -e 'hawkagent' | grep -e '#{domain_name}' | grep -v 'grep ' | awk '{print $2}' | xargs kill
EOH
end

execute 'start_hawkagent' do
  command "nohup #{hawkagent} 2>&1 &"
  cwd tra_domain_dir
  user config_user
  group config_group
end
