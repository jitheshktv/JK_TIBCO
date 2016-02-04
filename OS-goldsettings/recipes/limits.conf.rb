timestamp = Time.new.strftime("%F-%T")
remote_file "Backup of limits.conf file" do
  path "#{node['OS-goldsettings']['limits_config']['etc_dir']}/limits.conf_#{timestamp}"
  source "file://#{node['OS-goldsettings']['limits_config']['etc_dir']}/limits.conf"
  owner node['OS-goldsettings']['config']['user']
  group node['OS-goldsettings']['config']['group']
  mode '0544'
end

template "#{node['OS-goldsettings']['limits_config']['etc_dir']}/limits.conf" do
source 'limits.conf.erb'
owner node['OS-goldsettings']['config']['user']
group node['OS-goldsettings']['config']['group']
mode '0544'
end
