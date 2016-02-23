# variables
config_user = node['OS-goldsettings']['config']['user']
config_group = node['OS-goldsettings']['config']['group']

etc_dir = node['OS-goldsettings']['limits_config']['etc_dir']
limits_config = "#{etc_dir}/limits.conf"

# Create a copy of limits.conf file with timestamp
timestamp = Time.new.strftime('%F-%T')
remote_file 'Backup of limits.conf file' do
  path "#{limits_config}_#{timestamp}"
  source "file://#{limits_config}"
  owner config_user
  group config_group
  mode '0644'
end

# Update the limits.conf gold setting values using template
template "#{limits_config}" do
  source 'limits.conf.erb'
  owner config_user
  group config_group
  mode '0644'
end
