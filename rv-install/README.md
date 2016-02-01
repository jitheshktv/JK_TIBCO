# rv-install

This cookbook will install the TIBCO RV on a linux based environment. The cookbook attributes are defaulted to install the RV version 8.4.4, with TIBCO_HOME as /apps/tibco, and LOGS_HOME as /logs/tibco. The binary will be downloaded from S3 (or any remote source), and user:group used for the installation and configuration is esbuser:sgsup. These attributes can be customized using Custom JSON, overriding the below attributes. The cookbook is dependent on Java cookbook, which is taken from the chef supermarket.

For users and group :
default['rv-install']['install']['group']
default['rv-install']['install']['user']
default['rv-install']['config']['group']
default['rv-install']['config']['user']

For TIBCO_HOME and LOGS_HOME:
default['rv-install']['install']['tibco_home_name']
default['rv-install']['install']['tibco_home_dir']
default['rv-install']['install']['logs_home_dir']

For the version of RV :
default['rv-install']['install']['rv_bin_source'] = 'https://s3-us-west-2.amazonaws.com/rv-8.4.4-bin/linux/TIB_rv_8.4.4_linux_x86.zip'
default['rv-install']['install']['rv_bin_zip'] = 'TIB_rv_8.4.4_linux_x86.zip'
default['rv-install']['install']['rv_home_dir'] = '/apps/tibco/tibrv/8.4'

Example Custom JSON:
{
  "rv-install" : {
    "Install" : {
      "user" : "esbuser",
      "group" : "sgsup",
      "tibco_home_dir" : "/apps/tibco",
      "rv_home_dir" : "/apps/tibco/tibrv/8.4"
    }
  }
}
