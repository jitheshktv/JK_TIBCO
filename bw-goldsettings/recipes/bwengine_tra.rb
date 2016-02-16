config_user = node['bw-goldsettings']['config']['user']
config_group = node['bw-goldsettings']['config']['group']
bw_bin_dir = node['bw-goldsettings']['config']['bw_bin_dir']
bwengine = "#{bw_bin_dir}/bwengine.tra"

timestamp = Time.new.strftime("%F-%T")
remote_file "Backup of bwengine_tra file" do
path "#{bwengine}_#{timestamp}"
source "file://#{bwengine}"
owner config_user
group config_group
end

ruby_block 'Find and replce in bwengine_tra' do
block do
bwengine_tra = Chef::Util::FileEdit.new("#{bwengine}")
bwengine_tra.search_file_replace_line("tibco.tibjms.connect.attempts", "tibco.tibjms.connect.attempts=#{node['bw-goldsettings']['bwengine_tra_config']['connect_attempts']}")
not_if 'tibco.tibjms.connect.attempts'
bwengine_tra.insert_line_if_no_match("tibco.tibjms.connect.attempts", "tibco.tibjms.connect.attempts=#{node['bw-goldsettings']['bwengine_tra_config']['connect_attempts']}")
bwengine_tra.search_file_replace_line("tibco.tibjms.connect.attempt.timeout", "tibco.tibjms.connect.attempt.timeout=#{node['bw-goldsettings']['bwengine_tra_config']['connect_attempt_timeout']}")
not_if 'tibco.tibjms.connect.attempt.timeout'
bwengine_tra.insert_line_if_no_match("tibco.tibjms.connect.attempt.timeout", "tibco.tibjms.connect.attempt.timeout=#{node['bw-goldsettings']['bwengine_tra_config']['connect_attempt_timeout']}")
bwengine_tra.search_file_replace_line("EnableMemorySavingMode", "EnableMemorySavingMode=#{node['bw-goldsettings']['bwengine_tra_config']['EnableMemorySavingMode']}")
not_if 'EnableMemorySavingMode'
bwengine_tra.insert_line_if_no_match("EnableMemorySavingMode", "EnableMemorySavingMode=#{node['bw-goldsettings']['bwengine_tra_config']['EnableMemorySavingMode']}")
bwengine_tra.write_file
end
end

file "#{bwengine}.old" do
action :delete
end
