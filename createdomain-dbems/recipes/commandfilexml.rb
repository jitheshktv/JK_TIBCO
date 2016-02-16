#
# Cookbook Name:: createdomain-dbems
# Recipe:: commandfilexml
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#
# Generate the CreateDomain.xml from the template

# Initialize the variables
createdomain_cmdfile = node['createdomain-dbems']['config']['createdomain_cmdfile']

db_use_tns = node['createdomain-dbems']['config']['db_use_tns']
db_driver = node['createdomain-dbems']['config']['db_driver']

db_tnsname = node['createdomain-dbems']['config']['db_tnsname']
db_tnsfile = node['createdomain-dbems']['config']['db_tnsfile']
db_hostname = node['createdomain-dbems']['config']['db_hostname']
db_port = node['createdomain-dbems']['config']['db_port']
db_sid = node['createdomain-dbems']['config']['db_sid']

rv_port = node['createdomain-dbems']['config']['rv_port']
rv_network = node['createdomain-dbems']['config']['rv_network']
hawkhma_rv_daemonport = rv_port + 74

hawkhma_rv_daemon = "tcp:#{hawkhma_rv_daemonport}"
hawkhma_rv_network = rv_network
hawkhma_rv_service = hawkhma_rv_daemonport
tomcat_http_port = rv_port + 80
tomcat_ajp_port = rv_port + 81
tomcat_shutdown_port = rv_port + 82

tibco_instance_dir = node['createdomain-dbems']['config']['tibco_instance_dir']
tibcoadmin_version = node['createdomain-dbems']['config']['tibcoadmin_version']
tibcoadmin_home_dir = "#{tibco_instance_dir}/administrator/#{tibcoadmin_version}"

# Form the DB url based on the usage of TNS and the selected driver
if "#{db_use_tns}" == 'true'
  case db_driver
  when 'oracle.jdbc.driver.OracleDriver'
    db_connection_url = "jdbc:oracle:thin:@(TNSNamesFile=#{db_tnsfile};TNSServerName=#{db_tnsname})"
  when 'tibcosoftwareinc.jdbc.oracle.OracleDriver'
    db_connection_url = "jdbc:tibcosoftwareinc:oracle:TNSNamesFile=#{db_tnsfile};TNSServerName=#{db_tnsname}"
  end
else
  case db_driver
  when 'oracle.jdbc.driver.OracleDriver'
    db_connection_url = "jdbc:oracle:thin:@#{db_hostname}:#{db_port}:#{db_sid}"
  when 'tibcosoftwareinc.jdbc.oracle.OracleDriver'
    db_connection_url = "jdbc:tibcosoftwareinc:oracle://#{db_hostname}:#{db_port};SID=#{db_sid}"
  end
end

# Generate the CreateDomain commandfile XML from the template and based on the DB url
template 'CreateDomain.xml' do
  source 'CreateDomain.xml.erb'
  mode '0755'
  path createdomain_cmdfile
  variables(
    DatabaseUrl: db_connection_url,
    var_hawkhma_rv_daemon:  hawkhma_rv_daemon,
    var_hawkhma_rv_network:  hawkhma_rv_network,
    var_hawkhma_rv_service:  hawkhma_rv_service,
    var_tomcat_http_port:  tomcat_http_port,
    var_tomcat_ajp_port:  tomcat_ajp_port,
    var_tomcat_shutdown_port:  tomcat_shutdown_port,
    var_tibcoadmin_home_dir: tibcoadmin_home_dir
  )
end
