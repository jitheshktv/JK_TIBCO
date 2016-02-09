# dbclient-install

This cookbook will install the DB client libraries in the TIBCO server under the lib directory of the installed TRA version. The version of TRA and the version of DB driver jars to be installed are attributed to the cookbook. By default, the Oracle client for 11g and mySQL 5.1.38 are installed under the TRA version 5.10. The DB driver jars should be archived and uploaded to S3, and cookbook downloads it from there.

Attribute for the DB drivers and the S3 repo:
default['dbclient-install']['config']['s3_bucket'] = 'https://s3-us-west-2.amazonaws.com/db-client'
default['dbclient-install']['config']['db_client_version'] = 'ora11g_mysql-5.1.38'

Attributes for the TRA version and TIBCO HMOME DIR.
default['dbclient-install']['config']['tibco_install_dir'] = '/apps/tibco'
default['dbclient-install']['config']['tra_version'] = '5.10'

If a new version of driver needs to be installed, those jar files should be archived and uploaded to S3. Make sure that there are no folders in the archive, as the cookbook is expecting the libraries files directly under the zip archive, and not under any directories.
