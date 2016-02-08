timestamp = Time.new.strftime("%F-%T")
remote_file "Backup of tibemsd.conf file" do
path "#{node['ems-goldsettings']['config']['tibemsd_conf_path']}/tibemsd.conf_#{timestamp}"
source "file://#{node['ems-goldsettings']['config']['tibemsd_conf_path']}/tibemsd.conf"
owner node['ems-goldsettings']['config']['user']
group node['ems-goldsettings']['config']['group']
mode '0755'
end

ruby_block 'Find and replce in tibemsd.conf' do
block do
tibemsd_conf = Chef::Util::FileEdit.new("#{node['ems-goldsettings']['config']['tibemsd_conf_path']}/tibemsd.conf")
tibemsd_conf.search_file_replace_line("handshake_timeout", "handshake_timeout = #{node['ems-goldsettings']['tibemsd_config']['handshake_timeout']}")
tibemsd_conf.search_file_replace_line("max_msg_memory", "max_msg_memory = #{node['ems-goldsettings']['tibemsd_config']['max_msg_memory']}")
tibemsd_conf.search_file_replace_line("authorization", "authorization = #{node['ems-goldsettings']['tibemsd_config']['authorization']}")
tibemsd_conf.search_file_replace_line("routing", "routing = #{node['ems-goldsettings']['tibemsd_config']['routing']}")
tibemsd_conf.search_file_replace_line("flow_control", "flow_control = #{node['ems-goldsettings']['tibemsd_config']['flow_control']}")
tibemsd_conf.search_file_replace_line("ft_heartbeat", "ft_heartbeat = #{node['ems-goldsettings']['tibemsd_config']['ft_heartbeat']}")
tibemsd_conf.search_file_replace_line("ft_activation", "ft_activation = #{node['ems-goldsettings']['tibemsd_config']['ft_activation']}")
tibemsd_conf.search_file_replace_line("ft_reconnect_timeout", "ft_reconnect_timeout = #{node['ems-goldsettings']['tibemsd_config']['ft_reconnect_timeout']}")
tibemsd_conf.search_file_replace_line("client_timeout_server_connection", "client_timeout_server_connection = #{node['ems-goldsettings']['tibemsd_config']['client_timeout_server_connection']}")
tibemsd_conf.search_file_replace_line("server_timeout_client_connection", "server_timeout_client_connection = #{node['ems-goldsettings']['tibemsd_config']['server_timeout_client_connection']}")
tibemsd_conf.search_file_replace_line("server_timeout_server_connection", "server_timeout_server_connection = #{node['ems-goldsettings']['tibemsd_config']['server_timeout_server_connection']}")
tibemsd_conf.write_file
end
end

file "#{node['ems-goldsettings']['config']['tibemsd_conf_path']}/tibemsd.conf.old" do
action :delete
end
