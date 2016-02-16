config_user = node['admin-goldsettings']['config']['user']
config_group = node['admin-goldsettings']['config']['group']
tibcoadmin_domainhome_dir = node['admin-goldsettings']['config']['tibcoadmin_domainhome_dir']
domain_name = node['admin-goldsettings']['config']['domain_name']
tibcoadmin_bin_dir = "#{tibcoadmin_domainhome_dir}/#{domain_name}/bin"
administrator = "#{tibcoadmin_bin_dir}/tibcoadmin_#{domain_name}"

bash "stop_admin" do
user config_user
group config_group
code <<-EOH
ps -eaf | grep -e 'admin' | grep -e '#{domain_name}' | grep -v 'grep ' | awk '{print $2}' | xargs kill
EOH
end

execute 'start_admin' do
  command "nohup #{administrator} 2>&1 &"
  cwd tibcoadmin_bin_dir
  user config_user
  group config_group
end
