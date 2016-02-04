timestamp = Time.new.strftime("%F-%T")
remote_file "Backup of sysctl.conf file" do
  path "#{node['OS-goldsettings']['sysctl_config']['etc_dir']}/sysctl.conf_#{timestamp}"
  source "file://#{node['OS-goldsettings']['sysctl_config']['etc_dir']}/sysctl.conf"
  owner node['OS-goldsettings']['config']['user']
  group node['OS-goldsettings']['config']['group']
  mode '0544'
end

template "#{node['OS-goldsettings']['sysctl_config']['etc_dir']}/sysctl.conf" do
source 'sysctl.conf.erb'
owner node['OS-goldsettings']['config']['user']
group node['OS-goldsettings']['config']['group']
mode '0544'
end
