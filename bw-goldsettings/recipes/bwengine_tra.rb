# variables
config_user = node['bw-goldsettings']['config']['user']
config_group = node['bw-goldsettings']['config']['group']

bw_home_dir = node['bw-goldsettings']['config']['bw_home_dir']
bw_version = node['bw-goldsettings']['config']['bw_version']
bw_bin_dir = "#{bw_home_dir}/#{bw_version}/bin"
bwengine_tra = "#{bw_bin_dir}/bwengine.tra"

#Create a copy of bwengine.tra file with timestamp
timestamp = Time.new.strftime('%F-%T')
remote_file 'Backup of bwengine_tra file' do
  path "#{bwengine_tra}_#{timestamp}"
  source "file://#{bwengine_tra}"
  owner config_user
  group config_group
  mode '0755'
end

# Update the bwengine.tra gold setting values using ruby_block
ruby_block 'Configure bwengine_tra' do
  block do
    bwengine_tra_file = Chef::Util::FileEdit.new(bwengine_tra)
    bwengine_tra_file.search_file_replace_line("tibco.tibjms.connect.attempts", "tibco.tibjms.connect.attempts=#{node['bw-goldsettings']['bwengine_tra_config']['connect_attempts']}")
    bwengine_tra_file.insert_line_if_no_match("tibco.tibjms.connect.attempts", "tibco.tibjms.connect.attempts=#{node['bw-goldsettings']['bwengine_tra_config']['connect_attempts']}")
    bwengine_tra_file.search_file_replace_line("tibco.tibjms.connect.attempt.timeout", "tibco.tibjms.connect.attempt.timeout=#{node['bw-goldsettings']['bwengine_tra_config']['connect_attempt_timeout']}")
    bwengine_tra_file.insert_line_if_no_match("tibco.tibjms.connect.attempt.timeout", "tibco.tibjms.connect.attempt.timeout=#{node['bw-goldsettings']['bwengine_tra_config']['connect_attempt_timeout']}")
    bwengine_tra_file.search_file_replace_line("EnableMemorySavingMode", "EnableMemorySavingMode=#{node['bw-goldsettings']['bwengine_tra_config']['EnableMemorySavingMode']}")
    bwengine_tra_file.insert_line_if_no_match("EnableMemorySavingMode", "EnableMemorySavingMode=#{node['bw-goldsettings']['bwengine_tra_config']['EnableMemorySavingMode']}")
    bwengine_tra_file.write_file
  end
end

# Delete the back up file created by ruby_block
file "#{bwengine_tra}.old" do
  action :delete
end
