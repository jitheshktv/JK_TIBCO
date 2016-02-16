config_user = node['admin-goldsettings']['config']['user']
config_group = node['admin-goldsettings']['config']['group']
tibcoadmin_domainhome_dir = node['admin-goldsettings']['config']['tibcoadmin_domainhome_dir']
domain_name = node['admin-goldsettings']['config']['domain_name']
tibcoadmin_bin_dir = "#{tibcoadmin_domainhome_dir}/#{domain_name}/bin"
administrator = "#{tibcoadmin_bin_dir}/tibcoadmin_#{domain_name}"

timestamp = Time.new.strftime("%F-%T")
remote_file "Backup of tibcoadmin_tra file" do
path "#{administrator}.tra_#{timestamp}"
source "file://#{administrator}.tra"
owner config_user
group config_group
end

ruby_block 'Find and replce in tibcoadmin_tra' do
block do
tibcoadmin_tra = Chef::Util::FileEdit.new("#{administrator}.tra")
tibcoadmin_tra.search_file_replace_line("java.property.tibcoadmin.database.maxConnections", "java.property.tibcoadmin.database.maxConnections=#{node['admin-goldsettings']['tibcoadmin_tra_config']['max_connections']}")
not_if 'java.property.tibcoadmin.database.maxConnections'
tibcoadmin_tra.insert_line_if_no_match("java.property.tibcoadmin.database.maxConnections", "java.property.tibcoadmin.database.maxConnections=#{node['admin-goldsettings']['tibcoadmin_tra_config']['max_connections']}")
tibcoadmin_tra.search_file_replace_line("java.heap.size.min", "java.heap.size.min=#{node['admin-goldsettings']['tibcoadmin_tra_config']['heap_size_min']}")
not_if 'java.heap.size.min'
tibcoadmin_tra.insert_line_if_no_match("java.heap.size.min", "java.heap.size.min=#{node['admin-goldsettings']['tibcoadmin_tra_config']['heap_size_min']}")
tibcoadmin_tra.search_file_replace_line("java.heap.size.max", "java.heap.size.max=#{node['admin-goldsettings']['tibcoadmin_tra_config']['heap_size_max']}")
not_if 'java.heap.size.max'
tibcoadmin_tra.insert_line_if_no_match("java.heap.size.max", "java.heap.size.max=#{node['admin-goldsettings']['tibcoadmin_tra_config']['heap_size_max']}")
tibcoadmin_tra.search_file_replace_line("tibcoadmin.autoRefreshInterval", "tibcoadmin.autoRefreshInterval=#{node['admin-goldsettings']['tibcoadmin_tra_config']['autoRefreshInterval']}")
not_if 'tibcoadmin.autoRefreshInterval'
tibcoadmin_tra.insert_line_if_no_match("tibcoadmin.autoRefreshInterval", "tibcoadmin.autoRefreshInterval=#{node['admin-goldsettings']['tibcoadmin_tra_config']['autoRefreshInterval']}")
tibcoadmin_tra.search_file_replace_line("repo.auditFileSize", "repo.auditFileSize=#{node['admin-goldsettings']['tibcoadmin_tra_config']['auditFileSize']}")
not_if 'repo.auditFileSize'
tibcoadmin_tra.insert_line_if_no_match("repo.auditFileSize", "repo.auditFileSize=#{node['admin-goldsettings']['tibcoadmin_tra_config']['auditFileSize']}")
tibcoadmin_tra.write_file
end
end

file "#{administrator}.tra.old" do
action :delete
end
