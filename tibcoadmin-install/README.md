# tibcoadmin-install

This cookbook will install the TIBCO Administrator on a linux based environment, in silent mode. The silent mode responseFile will be created using the cookbook. The cookbook attributes are defaulted to install the Admin version 5.10, with TIBCO_HOME as /apps/tibco, and LOGS_HOME as /logs/tibco. The binary will be downloaded from S3 (or any remote source), and user:group used for the installation and configuration is esbuser:sgsup. These attributes can be customized using Custom JSON, overriding the below attributes. The cookbook is dependent on Java cookbook, which is taken from the chef supermarket. Administrator also needs RV, and TRA installed prior to the installation.

For users and group :
default['tibcoadmin-installinstall']['install']['group']
default['tibcoadmin-installinstall']['install']['user']
default['tibcoadmin-installinstall']['config']['group']
default['tibcoadmin-installinstall']['config']['user']

For TIBCO_HOME and LOGS_HOME:
default['tibcoadmin-installinstall']['install']['tibco_home_name']
default['tibcoadmin-installinstall']['install']['tibco_home_dir']
default['tibcoadmin-installinstall']['install']['logs_home_dir']

For the version of TRA :
default['tibcoadmin-installinstall']['install']['tibcoadmin_bin_source']
default['tibcoadmin-installinstall']['install']['tibcoadmin_bin_zip']
default['tibcoadmin-installinstall']['install']['tibcoadmin_version']

Example Custom JSON:
{
  "tibcoadmin-installinstall" : {
    "Install" : {
      "user" : "esbuser",
      "group" : "sgsup",
      "tibco_home_dir" : "/apps/tibco",
    }
  }
}
