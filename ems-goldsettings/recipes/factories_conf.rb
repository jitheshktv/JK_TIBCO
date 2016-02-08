timestamp = Time.new.strftime("%F-%T")
remote_file "Backup of factories.conf file" do
path "#{node['ems-goldsettings']['config']['shared_conf_path']}/factories.conf_#{timestamp}"
source "file://#{node['ems-goldsettings']['config']['shared_conf_path']}/factories.conf"
owner node['ems-goldsettings']['config']['user']
group node['ems-goldsettings']['config']['group']
mode '0755'
end

template "#{node['ems-goldsettings']['config']['shared_conf_path']}/factories.conf" do
source 'factories.conf.erb'
owner node['ems-goldsettings']['config']['user']
group node['ems-goldsettings']['config']['group']
mode '0544'
end
