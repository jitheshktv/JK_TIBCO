# bw-install

This cookbook will install the TIBCO BW on a linux based environment. The cookbook attributes are defaulted to install the BW version 5.13, with TIBCO_HOME as /apps/tibco, and LOGS_HOME as /logs/tibco. The binary will be downloaded from S3 (or any remote source), and user:group used for the installation and configuration is esbuser:sgsup. These attributes can be customized using Custom JSON, overriding the below attributes. The cookbook is dependent on Java cookbook, which is taken from the chef supermarket. The cookbook also needs RV and TRA installed prior to the installation.

For users and group :
default['bw-install']['install']['group']
default['bw-install']['install']['user']
default['bw-install']['config']['group']
default['bw-install']['config']['user']

For TIBCO_HOME and LOGS_HOME:
default['bw-install']['install']['tibco_home_name']
default['bw-install']['install']['tibco_home_dir']
default['bw-install']['install']['logs_home_dir']

For the version of BW :
default['bw-install']['install']['bw_bin_source']
default['bw-install']['install']['bw_bin_zip']
default['bw-install']['install']['bw_version']

Example Custom JSON:
{
  "bw-install" : {
    "Install" : {
      "user" : "esbuser",
      "group" : "sgsup",
      "tibco_home_dir" : "/apps/tibco",
    }
  }
}
