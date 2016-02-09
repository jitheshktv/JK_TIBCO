# jmsclient-install

This cookbook will install the JMS client libraries in the TIBCO server under the lib directory of the installed TRA version. The version of TRA and the version of JMS client to be installed are attributed to the cookbook. By default, the JMS client version 8.2.2 will be installed under the TRA version 5.10. The JMS client should be archived and uploaded to S3, and cookbook donwnloads it from there.

Attribute for the JMS Client version and the S3 repo:
default['jmsclient-install']['config']['s3_bucket'] = 'https://s3-us-west-2.amazonaws.com/ems-client'
default['jmsclient-install']['config']['ems_client_version'] = '8.2.2'

Attributes for the TRA version and TIBCO HMOME DIR.
default['jmsclient-install']['config']['tibco_install_dir'] = '/apps/tibco'
default['jmsclient-install']['config']['tra_version'] = '5.10'

If a new version of client needs to be installed, those client jar files should be archived and uploaded to S3. Make sure that there are no folders in the archive, as the cookbook is expecting the libraries files directly under the zip archive, and not under any directories.
