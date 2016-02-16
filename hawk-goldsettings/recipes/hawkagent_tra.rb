config_user = node['hawk-goldsettings']['config']['user']
config_group = node['hawk-goldsettings']['config']['group']
tra_domainhome_dir = node['hawk-goldsettings']['config']['tra_domainhome_dir']
domain_name = node['hawk-goldsettings']['config']['domain_name']
tra_domain_dir = "#{tra_domainhome_dir}/#{domain_name}"
hawkagent = "#{tra_domain_dir}/hawkagent_#{domain_name}"

timestamp = Time.new.strftime("%F-%T")
remote_file "Backup of hawkagent_tra file" do
path "#{hawkagent}.tra_#{timestamp}"
source "file://#{hawkagent}.tra"
owner config_user
group config_group
end

ruby_block 'Find and replce in hawkagent_tra' do
block do
hawkagent_tra = Chef::Util::FileEdit.new("#{hawkagent}.tra")
hawkagent_tra.search_file_replace_line("java.heap.size.max", "java.heap.size.max=#{node['hawk-goldsettings']['hawkagent_tra_config']['heap_size_max']}")
not_if 'java.heap.size.max'
hawkagent_tra.insert_line_if_no_match("java.heap.size.max", "java.heap.size.max=#{node['hawk-goldsettings']['hawkagent_tra_config']['heap_size_max']}")
hawkagent_tra.write_file
end
end

file "#{hawkagent}.tra.old" do
action :delete
end
