#
# Cookbook Name:: addmachine-dbems
# Recipe:: commandfilexml
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#
# Generate the AddMachine.xml from the template

# Intialize the variables
addmachine_cmdfile = node['addmachine-dbems']['config']['addmachine_cmdfile']

rv_port = node['addmachine-dbems']['config']['rv_port'].to_i
rv_network = node['addmachine-dbems']['config']['rv_network']
hawkhma_rv_daemonport = rv_port + 74

hawkhma_rv_daemon = "tcp:#{hawkhma_rv_daemonport}"
hawkhma_rv_network = rv_network
hawkhma_rv_service = hawkhma_rv_daemonport

tibco_instance_dir = node['addmachine-dbems']['config']['tibco_instance_dir']
tra_domainhome_dir = "#{tibco_instance_dir}/tra/domain"

# Generate the AddMachine.xml from the template
template 'AddMachine.xml' do
  source 'AddMachine.xml.erb'
  mode '0755'
  path addmachine_cmdfile
  variables(
    var_hawkhma_rv_daemon:  hawkhma_rv_daemon,
    var_hawkhma_rv_network:  hawkhma_rv_network,
    var_hawkhma_rv_service:  hawkhma_rv_service,
    var_tra_domainhome_dir: tra_domainhome_dir
  )
end
