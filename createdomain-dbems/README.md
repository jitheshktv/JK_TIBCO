# createdomain-dbems

The Cookbook for creating a DB/EMS based TIBCO administration domain. The default attributes can be overriden by passing custom JSON. The cookbook has recipe to create  the command file XML for the commandline domainutility, install the DB client and the JMS client jars and execute the domainutility to add the machine to the domain. Oracle DB is used. The domain can be either created using the thin driver or the data direct driver. The DB url can be either using TNS or contain the hostname, port and SID. The hawkagent for the domain will be started on successful machine addition to the domain.

The cookbook uses the below attributes be default

TIBCO_HOME_DIR and related :
default['createdomain-dbems']['config']['tibco_instance_dir'] = '/apps/tibco'
default['createdomain-dbems']['config']['logs_instance_dir'] = '/logs/tibco'
default['createdomain-dbems']['config']['tibcoadmin_home_dir'] = '/apps/tibco/administrator/5.10'
default['createdomain-dbems']['config']['tra_home_dir'] = '/apps/tibco/tra/5.10'
default['createdomain-dbems']['config']['tibcoadmin_domainhome_dir'] = '/apps/tibco/administrator/domain'
default['createdomain-dbems']['config']['tra_domainhome_dir'] = '/apps/tibco/tra/domain'

DOMAIN CREDENTIALS :
default['createdomain-dbems']['config']['domain_name'] = 'TEST_DOMAIN_DBEMS'
default['createdomain-dbems']['config']['administrator_user_name'] = 'admin'
default['createdomain-dbems']['config']['administrator_user_password'] = '#!S/PZNikhLBiI4iTu8H0jXbNe/xvWtlFp'

OTHER DOMAIN DETAILS :
default['createdomain-dbems']['config']['use_local_appdata'] = 'true'
default['createdomain-dbems']['config']['encoding'] = 'UTF-8'
default['createdomain-dbems']['config']['max_deployment_revisions'] = '5'

EMS TRANSPORT DETAILS :
default['createdomain-dbems']['config']['ems_server_url'] = 'tcp://sawgrass-adminserver-1.localdomain:7222'
default['createdomain-dbems']['config']['ems_user_name'] = 'domainadmin'
default['createdomain-dbems']['config']['ems_user_password'] = '#!2Qw95oT/yw5Dk4+ioC3xEEvjqRLSlNPN6S57AXq/f80='

DB DETAILS :
default['createdomain-dbems']['config']['db_use_tns'] = 'false'
default['createdomain-dbems']['config']['db_tnsfile'] = '/apps/tibco/tnsnames.ora'
default['createdomain-dbems']['config']['db_tnsname'] = 'TOOLSDB'
default['createdomain-dbems']['config']['db_user_name'] = 'jt94174'
default['createdomain-dbems']['config']['db_user_password'] = '#!xYT1XZIbd/1qZGW3vIUvg7bzlmrzB/YQ3o27fd4V5Ks='
default['createdomain-dbems']['config']['db_driver'] = 'oracle.jdbc.driver.OracleDriver'
default['createdomain-dbems']['config']['db_min_connections'] = '0'
default['createdomain-dbems']['config']['db_max_connections'] = '100'
default['createdomain-dbems']['config']['db_hostname'] = 'jk-tools.c523mohggalv.us-west-2.rds.amazonaws.com'
default['createdomain-dbems']['config']['db_port'] = '1521'
default['createdomain-dbems']['config']['db_sid'] = 'ORCL'

HAWK/RV DETAILS :
default['createdomain-dbems']['config']['hawkhma_rv_daemon'] = 'tcp:17474'
default['createdomain-dbems']['config']['hawkhma_rv_network'] = ';'
default['createdomain-dbems']['config']['hawkhma_rv_service'] = '17475'

PORT DETAILS :
default['createdomain-dbems']['config']['tomcat_http_port'] = '17080'
default['createdomain-dbems']['config']['tomcat_shutdown_port'] = '17005'
default['createdomain-dbems']['config']['tomcat_shutdown_string'] = 'SHUTDOWN'
