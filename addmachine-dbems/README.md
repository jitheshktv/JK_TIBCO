
# addmachine-dbems

The Cookbook for adding a TIBCO BW machine to a DB/EMS based tibco administration domain. The domain should be up and running. The default attributes can be overriden by passing custom JSON. The cookbook has recipe to create the command file XML for the commandline domainutility, install the DB client and the JMS client jars and executing the domainutility to add the machine to the domain. The hawkagent for the domain will be started on successful machine addition to the domain.

The cookbook by default uses the below attributes, and these can be overriden by using Custom JSON.

TIBCO_HOME_DIR:
default['addmachine-dbems']['config']['tibco_instance_dir'] = '/apps/tibco'
default['addmachine-dbems']['config']['logs_instance_dir'] = '/logs/tibco'
default['addmachine-dbems']['config']['tra_home_dir'] = '/apps/tibco/tra/5.10'
default['addmachine-dbems']['config']['tra_domainhome_dir'] = '/apps/tibco/tra/domain'

DOMAIN CREDENTIALS:
default['addmachine-dbems']['config']['domain_name'] = 'TEST_DOMAIN_DBEMS'
default['addmachine-dbems']['config']['administrator_user_name'] = 'admin'
default['addmachine-dbems']['config']['administrator_user_password'] = '#!S/PZNikhLBiI4iTu8H0jXbNe/xvWtlFp'

EMS TRANSPORT DETAILS:
default['addmachine-dbems']['config']['ems_server_url'] = 'tcp://sawgrass-adminserver-1.localdomain:7222'
default['addmachine-dbems']['config']['ems_user_name'] = 'domainadmin'
default['addmachine-dbems']['config']['ems_user_password'] = '#!2Qw95oT/yw5Dk4+ioC3xEEvjqRLSlNPN6S57AXq/f80='

DB DETAILS: You can either choose to create a TNS file and use the TNS entry in the DB URL, or use the DB url with host, port etc.
default['addmachine-dbems']['config']['db_use_tns'] = 'false'
default['addmachine-dbems']['config']['db_tnsfile'] = '/apps/tibco/tnsnames.ora'
default['addmachine-dbems']['config']['db_tnsname'] = 'TOOLSDB'
default['addmachine-dbems']['config']['db_driver'] = 'oracle.jdbc.driver.OracleDriver'
default['addmachine-dbems']['config']['db_min_connections'] = '0'
default['addmachine-dbems']['config']['db_max_connections'] = '100'
default['addmachine-dbems']['config']['db_hostname'] = 'jk-tools.c523mohggalv.us-west-2.rds.amazonaws.com'
default['addmachine-dbems']['config']['db_port'] = '1521'
default['addmachine-dbems']['config']['db_sid'] = 'ORCL'

HAWK/RV DETAILS:
default['addmachine-dbems']['config']['hawkhma_rv_daemon'] = 'tcp:17474'
default['addmachine-dbems']['config']['hawkhma_rv_network'] = ';'
default['addmachine-dbems']['config']['hawkhma_rv_service'] = '17475'

OTHER DOMAIN DETAILS:
default['addmachine-dbems']['config']['use_local_appdata'] = 'true'
default['addmachine-dbems']['config']['discover_timeout'] = '12000'
