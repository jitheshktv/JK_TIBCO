# variables
config_user = node['hawk-goldsettings']['config']['user']
config_group = node['hawk-goldsettings']['config']['group']

tra_domainhome_dir = node['hawk-goldsettings']['config']['tra_domainhome_dir']
domain_name = node['hawk-goldsettings']['config']['domain_name']
tra_domain_dir = "#{tra_domainhome_dir}/#{domain_name}"
hawkagent_cfg = "#{tra_domain_dir}/hawkagent.cfg"

# Create a copy of hawkagent.cfg file with timestamp
timestamp = Time.new.strftime('%F-%T')
remote_file 'Backup of hawkagent.cfg file' do
  path "#{hawkagent_cfg}_#{timestamp}"
  source "file://#{hawkagent_cfg}"
  owner config_user
  group config_group
end

# Update the hawkagent.cfg gold setting values using ruby_block
ruby_block 'Configure hawkagent.cfg' do
  block do
    hawkagent_cfg_file = Chef::Util::FileEdit.new(hawkagent_cfg)
    hawkagent_cfg_file.search_file_replace_line("-use_thread_pool", "-use_thread_pool #{node['hawk-goldsettings']['hawkagent_cfg_config']['use_thread_pool']}")
    hawkagent_cfg_file.insert_line_if_no_match("-use_thread_pool", "-use_thread_pool #{node['hawk-goldsettings']['hawkagent_cfg_config']['use_thread_pool']}")
    hawkagent_cfg_file.write_file
  end
end

# Delete the back up file created by ruby_block
file "#{hawkagent_cfg}.old" do
  action :delete
end
