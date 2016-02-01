# tra-install

# rv-install

This cookbook will install the TIBCO TRA on a linux based environment. The cookbook attributes are defaulted to install the TRA version 5.10, with TIBCO_HOME as /apps/tibco, and LOGS_HOME as /logs/tibco. The binary will be downloaded from S3 (or any remote source), and user:group used for the installation and configuration is esbuser:sgsup. These attributes can be customized using Custom JSON, overriding the below attributes. The cookbook is dependent on Java cookbook, which is taken from the chef supermarket. TRA also needs RV installed prior to the installation.

For users and group :
default['tra-install']['install']['group']
default['tra-install']['install']['user']
default['tra-install']['config']['group']
default['tra-install']['config']['user']

For TIBCO_HOME and LOGS_HOME:
default['tra-install']['install']['tibco_home_name']
default['tra-install']['install']['tibco_home_dir']
default['tra-install']['install']['logs_home_dir']

For the version of TRA :
default['tra-install']['install']['tra_bin_source']
default['tra-install']['install']['tra_bin_zip']
default['tra-install']['install']['tra_home_dir']

Example Custom JSON:
{
  "tra-install" : {
    "Install" : {
      "user" : "esbuser",
      "group" : "sgsup",
      "tibco_home_dir" : "/apps/tibco",
      "tra_home_dir" : "/apps/tibco/tra/5.10"
    }
  }
}
