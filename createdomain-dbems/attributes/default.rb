default['createdomain-dbems']['config']['user'] = 'esbuser'
default['createdomain-dbems']['config']['group'] = 'sgsup'

default['createdomain-dbems']['config']['tibco_instance_dir'] = '/apps/tibco'
default['createdomain-dbems']['config']['logs_instance_dir'] = '/logs/tibco'

default['createdomain-dbems']['config']['domain_name'] = 'TEST_DOMAIN_DBEMS'
default['createdomain-dbems']['config']['administrator_user_name'] = 'admin'
default['createdomain-dbems']['config']['administrator_user_password'] = 'admin'
default['createdomain-dbems']['config']['tibcoadmin_home_dir'] = '/apps/tibco/administrator/5.10'
default['createdomain-dbems']['config']['tra_home_dir'] = '/apps/tibco/tra/5.10'
default['createdomain-dbems']['config']['tibcoadmin_domainhome_dir'] = '/apps/tibco/administrator/domain'
default['createdomain-dbems']['config']['tra_domainhome_dir'] = '/apps/tibco/tra/domain'
default['createdomain-dbems']['config']['use_local_appdata'] = 'true'
default['createdomain-dbems']['config']['encoding'] = 'UTF-8'
default['createdomain-dbems']['config']['max_deployment_revisions'] = '5'

default['createdomain-dbems']['config']['ems_server_url'] = 'tcp://sawgrass-adminserver-1.localdomain:7222'
default['createdomain-dbems']['config']['ems_user_name'] = 'stsadmin'
default['createdomain-dbems']['config']['ems_user_password'] = 'password'

default['createdomain-dbems']['config']['db_tnsfile'] = '/apps/tibco/tnsnames.ora'
default['createdomain-dbems']['config']['db_tnsname'] = 'TOOLSDB'
default['createdomain-dbems']['config']['db_user_name'] = 'jt94174'
default['createdomain-dbems']['config']['db_user_password'] = 'JKJan2016'
default['createdomain-dbems']['config']['db_driver'] = 'tibcosoftwareinc.jdbc.oracle.OracleDriver'
default['createdomain-dbems']['config']['db_min_connections'] = '0'
default['createdomain-dbems']['config']['db_max_connections'] = '100'

default['createdomain-dbems']['config']['db_hostname'] = 'jk-tools.c523mohggalv.us-west-2.rds.amazonaws.com'
default['createdomain-dbems']['config']['db_port'] = '1521'
default['createdomain-dbems']['config']['db_sid'] = 'ORCL'

default['createdomain-dbems']['config']['hawkhma_rv_daemon'] = 'tcp:17474'
default['createdomain-dbems']['config']['hawkhma_rv_network'] = ';'
default['createdomain-dbems']['config']['hawkhma_rv_service'] = '17475'

default['createdomain-dbems']['config']['tomcat_http_port'] = '17080'
default['createdomain-dbems']['config']['tomcat_shutdown_port'] = '17005'
default['createdomain-dbems']['config']['tomcat_shutdown_string'] = 'SHUTDOWN'

default['createdomain-dbems']['config']['createdomain_cmdfile'] = '/tmp/CreateDomain.xml'
