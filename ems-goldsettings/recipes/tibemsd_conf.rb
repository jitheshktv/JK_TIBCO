#variables
config_user = node['ems-goldsettings']['config']['user']
config_group = node['ems-goldsettings']['config']['group']

ems_config_home = node['ems-goldsettings']['config']['ems_config_home']
ems_instance_name = node['ems-goldsettings']['config']['ems_instance_name']
tibemsd_conf_path = "#{ems_config_home}/#{ems_instance_name}/conf"
tibemsd_conf = "#{tibemsd_conf_path}/tibemsd.conf"

# Create a copy of tibemsd.conf file with timestamp
timestamp = Time.new.strftime('%F-%T')
remote_file 'Backup of tibemsd.conf file' do
  path "#{tibemsd_conf}_#{timestamp}"
  source "file://#{tibemsd_conf}"
  owner config_user
  group config_group
  mode '0755'
end

#Update the tibemsd.conf gold setting values using ruby_block
ruby_block 'Configure tibemsd.conf' do
  block do
    tibemsd_conf_file = Chef::Util::FileEdit.new(tibemsd_conf)
    tibemsd_conf_file.search_file_replace_line("handshake_timeout", "handshake_timeout = #{node['ems-goldsettings']['tibemsd_config']['handshake_timeout']}")
    tibemsd_conf_file.insert_line_if_no_match("handshake_timeout", "handshake_timeout = #{node['ems-goldsettings']['tibemsd_config']['handshake_timeout']}")
    tibemsd_conf_file.search_file_replace_line("max_msg_memory", "max_msg_memory = #{node['ems-goldsettings']['tibemsd_config']['max_msg_memory']}")
    tibemsd_conf_file.insert_line_if_no_match("max_msg_memory", "max_msg_memory = #{node['ems-goldsettings']['tibemsd_config']['max_msg_memory']}")
    tibemsd_conf_file.search_file_replace_line("authorization", "authorization = #{node['ems-goldsettings']['tibemsd_config']['authorization']}")
    tibemsd_conf_file.insert_line_if_no_match("authorization", "authorization = #{node['ems-goldsettings']['tibemsd_config']['authorization']}")
    tibemsd_conf_file.search_file_replace_line("routing", "routing = #{node['ems-goldsettings']['tibemsd_config']['routing']}")
    tibemsd_conf_file.insert_line_if_no_match("routing", "routing = #{node['ems-goldsettings']['tibemsd_config']['routing']}")
    tibemsd_conf_file.search_file_replace_line("flow_control", "flow_control = #{node['ems-goldsettings']['tibemsd_config']['flow_control']}")
    tibemsd_conf_file.insert_line_if_no_match("flow_control", "flow_control = #{node['ems-goldsettings']['tibemsd_config']['flow_control']}")
    tibemsd_conf_file.search_file_replace_line("ft_heartbeat", "ft_heartbeat = #{node['ems-goldsettings']['tibemsd_config']['ft_heartbeat']}")
    tibemsd_conf_file.insert_line_if_no_match("ft_heartbeat", "ft_heartbeat = #{node['ems-goldsettings']['tibemsd_config']['ft_heartbeat']}")
    tibemsd_conf_file.search_file_replace_line("ft_activation", "ft_activation = #{node['ems-goldsettings']['tibemsd_config']['ft_activation']}")
    tibemsd_conf_file.insert_line_if_no_match("ft_activation", "ft_activation = #{node['ems-goldsettings']['tibemsd_config']['ft_activation']}")
    tibemsd_conf_file.search_file_replace_line("ft_reconnect_timeout", "ft_reconnect_timeout = #{node['ems-goldsettings']['tibemsd_config']['ft_reconnect_timeout']}")
    tibemsd_conf_file.insert_line_if_no_match("ft_reconnect_timeout", "ft_reconnect_timeout = #{node['ems-goldsettings']['tibemsd_config']['ft_reconnect_timeout']}")
    tibemsd_conf_file.search_file_replace_line("client_timeout_server_connection", "client_timeout_server_connection = #{node['ems-goldsettings']['tibemsd_config']['client_timeout_server_connection']}")
    tibemsd_conf_file.insert_line_if_no_match("client_timeout_server_connection", "client_timeout_server_connection = #{node['ems-goldsettings']['tibemsd_config']['client_timeout_server_connection']}")
    tibemsd_conf_file.search_file_replace_line("server_timeout_client_connection", "server_timeout_client_connection = #{node['ems-goldsettings']['tibemsd_config']['server_timeout_client_connection']}")
    tibemsd_conf_file.insert_line_if_no_match("server_timeout_client_connection", "server_timeout_client_connection = #{node['ems-goldsettings']['tibemsd_config']['server_timeout_client_connection']}")
    tibemsd_conf_file.search_file_replace_line("server_timeout_server_connection", "server_timeout_server_connection = #{node['ems-goldsettings']['tibemsd_config']['server_timeout_server_connection']}")
    tibemsd_conf_file.insert_line_if_no_match("server_timeout_server_connection", "server_timeout_server_connection = #{node['ems-goldsettings']['tibemsd_config']['server_timeout_server_connection']}")
    tibemsd_conf_file.write_file
  end
end

# Delete the back up file created by ruby_block
file "#{tibemsd_conf}.old" do
  action :delete
end
