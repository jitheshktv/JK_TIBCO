#
# Cookbook Name:: createdomain-dbems
# Recipe:: postconfig
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#
# Configure hawkagent, administrator and strat the services
#

# variables
config_user = node['createdomain-dbems']['config']['user']
config_group = node['createdomain-dbems']['config']['group']

tibco_instance_dir = node['createdomain-dbems']['config']['tibco_instance_dir']
logs_instance_dir = node['createdomain-dbems']['config']['logs_instance_dir']
domain_name = node['createdomain-dbems']['config']['domain_name']
tibcoadmin_domainhome_dir = "#{tibco_instance_dir}/administrator/domain"
tra_domainhome_dir = "#{tibco_instance_dir}/tra/domain"
tra_domain_dir = "#{tra_domainhome_dir}/#{domain_name}"
hawkagent = "#{tra_domain_dir}/hawkagent_#{domain_name}"
hawkagent_tra = "#{hawkagent}.tra"
hawkagent_cfg = "#{tra_domain_dir}/hawkagent.cfg"
tibcoadmin_bin_dir = "#{tibcoadmin_domainhome_dir}/#{domain_name}/bin"
administrator = "#{tibcoadmin_bin_dir}/tibcoadmin_#{domain_name}"
administrator_tra = "#{administrator}.tra"

hawkagent_cfg_threadpool = node['createdomain-dbems']['config']['hawkagent_cfg_threadpool']
hawkagent_tra_maxheap = node['createdomain-dbems']['config']['hawkagent_tra_maxheap']
logs_temp_dir = "#{logs_instance_dir}/tmp"
tibcoadmin_minheap = node['createdomain-dbems']['config']['tibcoadmin_minheap']
tibcoadmin_maxheap = node['createdomain-dbems']['config']['tibcoadmin_maxheap']
tibcoadmin_maxconn = node['createdomain-dbems']['config']['tibcoadmin_maxconn']
tibcoadmin_auditfilesize = node['createdomain-dbems']['config']['tibcoadmin_auditFileSize']
tibcoadmin_autorfrshint = node['createdomain-dbems']['config']['tibcoadmin_autoRefreshInterval']

# Change the configuration in hawkagent.cfg
ruby_block 'configure hawkagent.cfg' do
  block do
    hawkagent_cfg_file = Chef::Util::FileEdit.new(hawkagent_cfg)
    hawkagent_cfg_file.search_file_replace_line('-use_thread_pool', "-use_thread_pool #{hawkagent_cfg_threadpool}")
    hawkagent_cfg_file.insert_line_if_no_match('-use_thread_pool', "-use_thread_pool=#{hawkagent_cfg_threadpool}")
    hawkagent_cfg_file.write_file
  end
end

# Change the configuration in hawkagent_domain.tra
ruby_block 'configure hawkagent_domain.tra' do
  block do
    hawkagent_tra_file = Chef::Util::FileEdit.new(hawkagent_tra)
    hawkagent_tra_file.search_file_replace_line(/java.heap.size.max/, "java.heap.size.max=#{hawkagent_tra_maxheap}")
    hawkagent_tra_file.insert_line_if_no_match(/java.heap.size.max/, "java.heap.size.max=#{hawkagent_tra_maxheap}")
    hawkagent_tra_file.search_file_replace_line(/java.property.java.io.tmpdir/, "java.property.java.io.tmpdir=#{logs_temp_dir}")
    hawkagent_tra_file.insert_line_if_no_match(/java.property.java.io.tmpdir/, "java.property.java.io.tmpdir=#{logs_temp_dir}")
    hawkagent_tra_file.write_file
  end
end

# Start the hawkagent
execute 'start_hawkagent' do
  command "nohup #{hawkagent} 2>&1 &"
  cwd tra_domain_dir
  user config_user
  group config_group
end

# Change the configuration in administrator.tra
ruby_block 'configure tibcoadmin_domain.tra' do
  block do
    administrator_tra_file = Chef::Util::FileEdit.new(administrator_tra)
    administrator_tra_file.search_file_replace_line('java.heap.size.min', "java.heap.size.min=#{tibcoadmin_minheap}")
    administrator_tra_file.insert_line_if_no_match('java.heap.size.min', "java.heap.size.min=#{tibcoadmin_minheap}")
    administrator_tra_file.search_file_replace_line('java.heap.size.max', "java.heap.size.max=#{tibcoadmin_maxheap}")
    administrator_tra_file.insert_line_if_no_match('java.heap.size.max', "java.heap.size.max=#{tibcoadmin_maxheap}")
    administrator_tra_file.search_file_replace_line('java.property.tibcoadmin.database.maxConnections', "java.property.tibcoadmin.database.maxConnections=#{tibcoadmin_maxconn}")
    administrator_tra_file.insert_line_if_no_match('java.property.tibcoadmin.database.maxConnections', "java.property.tibcoadmin.database.maxConnections=#{tibcoadmin_maxconn}")
    administrator_tra_file.search_file_replace_line('tibcoadmin.autoRefreshInterval', "tibcoadmin.autoRefreshInterval=#{tibcoadmin_autorfrshint}")
    administrator_tra_file.insert_line_if_no_match('tibcoadmin.autoRefreshInterval', "tibcoadmin.autoRefreshInterval=#{tibcoadmin_autorfrshint}")
    administrator_tra_file.search_file_replace_line('repo.auditFileSize', "repo.auditFileSize=#{tibcoadmin_auditfilesize}")
    administrator_tra_file.insert_line_if_no_match('repo.auditFileSize', "repo.auditFileSize=#{tibcoadmin_auditfilesize}")
    administrator_tra_file.search_file_replace_line('java.property.java.io.tmpdir', "java.property.java.io.tmpdir=#{logs_temp_dir}")
    administrator_tra_file.insert_line_if_no_match('java.property.java.io.tmpdir', "java.property.java.io.tmpdir=#{logs_temp_dir}")
    administrator_tra_file.write_file
  end
end

# Start the administrator
execute 'start_admin' do
  command "nohup #{administrator} 2>&1 &"
  cwd tibcoadmin_bin_dir
  user config_user
  group config_group
end
