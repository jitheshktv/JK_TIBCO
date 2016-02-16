config_user = node['hawk-goldsettings']['config']['user']
config_group = node['hawk-goldsettings']['config']['group']
tra_domainhome_dir = node['hawk-goldsettings']['config']['tra_domainhome_dir']
domain_name = node['hawk-goldsettings']['config']['domain_name']
tra_domain_dir = "#{tra_domainhome_dir}/#{domain_name}"
hawkagent = "#{tra_domain_dir}/hawkagent.cfg"


timestamp = Time.new.strftime("%F-%T")
remote_file "Backup of hawkagent.cfg file" do
path "#{hawkagent}_#{timestamp}"
source "file://#{hawkagent}"
owner config_user
group config_group
end

ruby_block 'Find and replce in hawkagent.cfg' do
block do
hawkagent_cfg = Chef::Util::FileEdit.new("#{hawkagent}")
hawkagent_cfg.search_file_replace_line("-use_thread_pool", "-use_thread_pool=#{node['hawk-goldsettings']['hawkagent_cfg_config']['use_thread_pool']}")
not_if '-use_thread_pool'
hawkagent_cfg.insert_line_if_no_match("-use_thread_pool", "-use_thread_pool=#{node['hawk-goldsettings']['hawkagent_cfg_config']['use_thread_pool']}")
hawkagent_cfg.write_file
end
end

file "#{hawkagent}.old" do
action :delete
end
