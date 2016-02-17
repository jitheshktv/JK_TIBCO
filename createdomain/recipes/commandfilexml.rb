#
# Cookbook Name:: createdomain
# Recipe:: commandfilexml
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#
# Generate the CreateDomain.xml from the template

createdomain_cmdfile = node['createdomain-rv']['config']['createdomain_cmdfile']

rv_port = node['createdomain-rv']['config']['rv_port'].to_i
rv_network = node['createdomain-rv']['config']['rv_network']
application_hawk_daemonport = rv_port + 74

application_rv_daemon = "tcp:#{rv_port}"
application_rv_network = rv_network
application_rv_service = rv_port
application_hawk_daemon = "tcp:#{application_hawk_daemonport}"
application_hawk_network = rv_network
application_hawk_service = application_hawk_daemonport
tomcat_http_port = rv_port + 80
tomcat_ajp_port = rv_port + 81
tomcat_shutdown_port = rv_port + 82

template 'CreateDomain.xml' do
  source 'CreateDomain.xml.erb'
  mode '0755'
  path createdomain_cmdfile
  variables(
    var_application_rv_daemon:  application_rv_daemon,
    var_application_rv_network:  application_rv_network,
    var_application_rv_service:  application_rv_service,
    var_application_hawk_daemon:  application_hawk_daemon,
    var_application_hawk_network:  application_hawk_network,
    var_application_hawk_service:  application_hawk_service,
    var_tomcat_http_port:  tomcat_http_port,
    var_tomcat_ajp_port:  tomcat_ajp_port,
    var_tomcat_shutdown_port:  tomcat_shutdown_port
  )
end
