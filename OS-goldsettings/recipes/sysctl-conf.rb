#This recipe is created to update the OS gold setting values for the sysctl.cnf under /etc directory

# Take back up of sysctl.conf file with timestamp
timestamp = Time.new.strftime("%F-%T")
remote_file "Backup of sysctl.conf file" do
  path "#{node['OS-goldsettings']['config']['etc_dir']}/sysctl.conf_#{timestamp}"
  source "file://#{node['OS-goldsettings']['config']['etc_dir']}/sysctl.conf"
  owner node['OS-goldsettings']['config']['user']
  group node['OS-goldsettings']['config']['group']
  mode '0644'
end

# Update the sysctl.conf file with gold settings values
ruby_block 'update sysctl.conf file' do
  block do
    sysctl_conf = Chef::Util::FileEdit.new("#{node['OS-goldsettings']['config']['etc_dir']}/sysctl.conf")
    sysctl_conf.insert_line_if_no_match("net.ipv4.ip_local_port_range", "\n#Tibco Settings\nnet.ipv4.ip_local_port_range = #{node['ip_local_port_range']}")
    sysctl_conf.insert_line_if_no_match("net.core.rmem_max", "net.core.rmem_max = #{node['rmem_max']}")
    sysctl_conf.insert_line_if_no_match("net.core.wmem_max", "net.core.wmem_max = #{node['wmem_max']}")
    sysctl_conf.insert_line_if_no_match("net.ipv4.tcp_rmem", "net.ipv4.tcp_rmem = #{node['tcp_rmem']}")
    sysctl_conf.insert_line_if_no_match("net.ipv4.tcp_wmem", "net.ipv4.tcp_wmem = #{node['tcp_wmem']}")
    sysctl_conf.insert_line_if_no_match("net.ipv4.tcp_fin_timeout", "net.ipv4.tcp_fin_timeout = #{node['tcp_fin_timeout']}")
    sysctl_conf.insert_line_if_no_match("net.core.netdev_max_backlog", "net.core.netdev_max_backlog = #{node['netdev_max_backlog']}")
    sysctl_conf.insert_line_if_no_match("net.core.somaxconn", "net.core.somaxconn = #{node['somaxconn']}")
    sysctl_conf.insert_line_if_no_match("net.ipv4.tcp_keepalive_intvl", "net.ipv4.tcp_keepalive_intvl = #{node['tcp_keepalive_intvl']}")
    sysctl_conf.insert_line_if_no_match("net.ipv4.tcp_keepalive_probes", "net.ipv4.tcp_keepalive_probes = #{node['tcp_keepalive_probes']}")
    sysctl_conf.insert_line_if_no_match("kernel.sem", "kernel.sem = #{node['kernell.sem']}")
    sysctl_conf.insert_line_if_no_match("kernel.msgmni", "kernel.msgmni = #{node['kernel.msgmni']}")
    sysctl_conf.insert_line_if_no_match("kernel.shmmni", "kernel.shmmni = #{node['kernel.shmmni']}")
    sysctl_conf.insert_line_if_no_match("net.ipv4.tcp_keepalive_time", "net.ipv4.tcp_keepalive_time = #{node['tcp_keepalive_time']}")
    sysctl_conf.insert_line_if_no_match("net.ipv4.tcp_slow_start_after_idle", "net.ipv4.tcp_slow_start_after_idle = #{node['tcp_slow_start_after_idle']}")
    sysctl_conf.insert_line_if_no_match("kernel.pid_max", "kernel.pid_max = #{node['kernel.pid_max']}")
    sysctl_conf.insert_line_if_no_match("fs.file-max", "fs.file-max = #{node['fs.file-max']}")
    sysctl_conf.write_file
  end
end

#Delete the back up file created by ruby_block
file "#{node['OS-goldsettings']['config']['etc_dir']}/sysctl.conf.old" do
  action :delete
end
