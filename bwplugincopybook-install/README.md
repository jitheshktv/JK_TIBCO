# bwplugincopybook-install

This cookbook will install the TIBCO BW Plugin for CCB on a linux based environment. The cookbook attributes are defaulted to install the CCB plugin 2.0 version 6.1, with TIBCO_HOME as /apps/tibco, and LOGS_HOME as /logs/tibco. The binary will be downloaded from S3 (or any remote source), and user:group used for the installation and configuration is esbuser:sgsup. These attributes can be customized using Custom JSON, overriding the below attributes. The cookbook is dependent on Java cookbook, which is taken from the chef supermarket. The CCB plugin also needs RV, TRA and BW installed prior to the installation.

For users and group :
default['bwplugincopybook-install']['install']['group']
default['bwplugincopybook-install']['install']['user']
default['bwplugincopybook-install']['config']['group']
default['bwplugincopybook-install']['config']['user']

For TIBCO_HOME and LOGS_HOME:
default['bwplugincopybook-install']['install']['tibco_home_name']
default['bwplugincopybook-install']['install']['tibco_home_dir']
default['bwplugincopybook-install']['install']['logs_home_dir']

For the version of CCB plugin :
default['bwplugincopybook-install']['install']['bwplugincopybook_bin_source']
default['bwplugincopybook-install']['install']['bwplugincopybook_bin_zip']

Example Custom JSON:
{
  "bwplugincopybook-install" : {
    "Install" : {
      "user" : "esbuser",
      "group" : "sgsup",
      "tibco_home_dir" : "/apps/tibco",
    }
  }
}

version 0.1.1 :
- Added README.
- Deleted the below attribute copybook_jar, to dynamically set it in the install recipe based on tibco_install_dir.
