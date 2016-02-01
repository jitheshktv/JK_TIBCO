default['addmachine-dbems']['config']['user'] = 'esbuser'
default['addmachine-dbems']['config']['group'] = 'sgsup'

default['addmachine-dbems']['config']['tibco_instance_dir'] = '/apps/tibco'
default['addmachine-dbems']['config']['logs_instance_dir'] = '/logs/tibco'

default['addmachine-dbems']['config']['domain_name'] = 'TEST_DOMAIN_DBEMS'
default['addmachine-dbems']['config']['administrator_user_name'] = 'admin'
default['addmachine-dbems']['config']['administrator_user_password'] = 'admin'
default['addmachine-dbems']['config']['tra_home_dir'] = '/apps/tibco/tra/5.10'
default['addmachine-dbems']['config']['tra_domainhome_dir'] = '/apps/tibco/tra/domain'
default['addmachine-dbems']['config']['use_local_appdata'] = 'true'
default['addmachine-dbems']['config']['discover_timeout'] = '12000'

default['addmachine-dbems']['config']['ems_server_url'] = 'tcp://sawgrass-adminserver-1.localdomain:7222'
default['addmachine-dbems']['config']['ems_user_name'] = 'domainadmin'
default['addmachine-dbems']['config']['ems_user_password'] = '#!2Qw95oT/yw5Dk4+ioC3xEEvjqRLSlNPN6S57AXq/f80='

default['addmachine-dbems']['config']['db_use_tns'] = 'false'
default['addmachine-dbems']['config']['db_tnsfile'] = '/apps/tibco/tnsnames.ora'
default['addmachine-dbems']['config']['db_tnsname'] = 'TOOLSDB'
default['addmachine-dbems']['config']['db_driver'] = 'oracle.jdbc.driver.OracleDriver'
default['addmachine-dbems']['config']['db_min_connections'] = '0'
default['addmachine-dbems']['config']['db_max_connections'] = '100'
default['addmachine-dbems']['config']['db_hostname'] = 'jk-tools.c523mohggalv.us-west-2.rds.amazonaws.com'
default['addmachine-dbems']['config']['db_port'] = '1521'
default['addmachine-dbems']['config']['db_sid'] = 'ORCL'

default['addmachine-dbems']['config']['hawkhma_rv_daemon'] = 'tcp:17474'
default['addmachine-dbems']['config']['hawkhma_rv_network'] = ';'
default['addmachine-dbems']['config']['hawkhma_rv_service'] = '17475'

default['addmachine-dbems']['config']['addmachine_cmdfile'] = '/tmp/AddMachine.xml'
