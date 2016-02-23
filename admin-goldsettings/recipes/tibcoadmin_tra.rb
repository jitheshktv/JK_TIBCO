#variables
config_user = node['admin-goldsettings']['config']['user']
config_group = node['admin-goldsettings']['config']['group']

tibcoadmin_domainhome_dir = node['admin-goldsettings']['config']['tibcoadmin_domainhome_dir']
domain_name = node['admin-goldsettings']['config']['domain_name']
tibcoadmin_bin_dir = "#{tibcoadmin_domainhome_dir}/#{domain_name}/bin"
administrator = "#{tibcoadmin_bin_dir}/tibcoadmin_#{domain_name}"
administrator_tra = "#{administrator}.tra"

# Create a copy of tibcoadmin_<domain_name>.tra file with timestamp
timestamp = Time.new.strftime('%F-%T')
remote_file 'Backup of tibcoadmin_tra file' do
  path "#{administrator_tra}_#{timestamp}"
  source "file://#{administrator_tra}"
  owner config_user
  group config_group
  mode '0755'
end

# Update the tibcoadmin_<domain_name>.tra gold setting values using ruby_block
ruby_block 'Configure tibcoadmin_<domain_name>.tra' do
  block do
    administrator_tra_file = Chef::Util::FileEdit.new(administrator_tra)
    administrator_tra_file.search_file_replace_line("java.property.tibcoadmin.database.maxConnections", "java.property.tibcoadmin.database.maxConnections=#{node['admin-goldsettings']['tibcoadmin_tra_config']['max_connections']}")
    administrator_tra_file.insert_line_if_no_match("java.property.tibcoadmin.database.maxConnections", "java.property.tibcoadmin.database.maxConnections=#{node['admin-goldsettings']['tibcoadmin_tra_config']['max_connections']}")
    administrator_tra_file.search_file_replace_line("java.heap.size.min", "java.heap.size.min=#{node['admin-goldsettings']['tibcoadmin_tra_config']['heap_size_min']}")
    administrator_tra_file.insert_line_if_no_match("java.heap.size.min", "java.heap.size.min=#{node['admin-goldsettings']['tibcoadmin_tra_config']['heap_size_min']}")
    administrator_tra_file.search_file_replace_line("java.heap.size.max", "java.heap.size.max=#{node['admin-goldsettings']['tibcoadmin_tra_config']['heap_size_max']}")
    administrator_tra_file.insert_line_if_no_match("java.heap.size.max", "java.heap.size.max=#{node['admin-goldsettings']['tibcoadmin_tra_config']['heap_size_max']}")
    administrator_tra_file.search_file_replace_line("tibcoadmin.autoRefreshInterval", "tibcoadmin.autoRefreshInterval=#{node['admin-goldsettings']['tibcoadmin_tra_config']['autoRefreshInterval']}")
    administrator_tra_file.insert_line_if_no_match("tibcoadmin.autoRefreshInterval", "tibcoadmin.autoRefreshInterval=#{node['admin-goldsettings']['tibcoadmin_tra_config']['autoRefreshInterval']}")
    administrator_tra_file.search_file_replace_line("repo.auditFileSize", "repo.auditFileSize=#{node['admin-goldsettings']['tibcoadmin_tra_config']['auditFileSize']}")
    administrator_tra_file.insert_line_if_no_match("repo.auditFileSize", "repo.auditFileSize=#{node['admin-goldsettings']['tibcoadmin_tra_config']['auditFileSize']}")
    administrator_tra_file.write_file
  end
end

# Delete the back up file created by ruby_block
file "#{administrator_tra}.old" do
  action :delete
end
