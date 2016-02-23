# variables
config_user = node['hawk-goldsettings']['config']['user']
config_group = node['hawk-goldsettings']['config']['group']

tra_domainhome_dir = node['hawk-goldsettings']['config']['tra_domainhome_dir']
domain_name = node['hawk-goldsettings']['config']['domain_name']
tra_domain_dir = "#{tra_domainhome_dir}/#{domain_name}"
hawkagent = "#{tra_domain_dir}/hawkagent_#{domain_name}"
hawkagent_tra = "#{hawkagent}.tra"

# Create a copy of hawkagent_<domain_name>.tra file
timestamp = Time.new.strftime('%F-%T')
remote_file 'Backup of hawkagent_<domain_name>.tra file' do
  path "#{hawkagent_tra}_#{timestamp}"
  source "file://#{hawkagent_tra}"
  owner config_user
  group config_group
end

# Update the hawkagent_<domain_name>.tra gold setting values using ruby_block
ruby_block 'Configure hawkagent_tra' do
  block do
    hawkagent_tra_file = Chef::Util::FileEdit.new(hawkagent_tra)
    hawkagent_tra_file.search_file_replace_line("java.heap.size.max", "java.heap.size.max=#{node['hawk-goldsettings']['hawkagent_tra_config']['heap_size_max']}")
    hawkagent_tra_file.insert_line_if_no_match("java.heap.size.max", "java.heap.size.max=#{node['hawk-goldsettings']['hawkagent_tra_config']['heap_size_max']}")
    hawkagent_tra_file.write_file
  end
end

# Delete the back up file created by ruby_block
file "#{hawkagent_tra}.old" do
  action :delete
end
