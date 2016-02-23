# variables
config_user = node['OS-goldsettings']['config']['user']
config_group = node['OS-goldsettings']['config']['group']

etc_dir = node['OS-goldsettings']['sysctl_config']['etc_dir']
sysctl_config = "#{etc_dir}/sysctl.conf"

# Create a copy of sysctl.conf file with timestamp
timestamp = Time.new.strftime('%F-%T')
remote_file 'Backup of sysctl.conf file' do
  path "#{sysctl_config}_#{timestamp}"
  source "file://#{sysctl_config}"
  owner config_user
  group config_group
  mode '0644'
end

# Update the sysctl.conf gold setting values using template
template "#{sysctl_config}" do
  source 'sysctl.conf.erb'
  owner config_user
  group config_group
  mode '0644'
end
