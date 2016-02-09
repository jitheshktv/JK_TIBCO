# sdk-install

This cookbook will install the TIBCO SDK on a linux based environment. The cookbook attributes are defaulted to install the SDK version 5.8, with TIBCO_HOME as /apps/tibco, and LOGS_HOME as /logs/tibco. The binary will be downloaded from S3 (or any remote source), and user:group used for the installation and configuration is esbuser:sgsup. These attributes can be customized using Custom JSON, overriding the below attributes. The cookbook is dependent on Java cookbook, which is taken from the chef supermarket. SDK also needs RV, TRA and BW installed prior to the installation.

For users and group :
default['sdk_install']['install']['group']
default['sdk-install']['install']['user']
default['sdk-install']['config']['group']
default['sdk-install']['config']['user']

For TIBCO_HOME and LOGS_HOME:
default['sdk-install']['install']['tibco_home_name']
default['sdk-install']['install']['tibco_home_dir']
default['sdk-install']['install']['logs_home_dir']

For the version of SDK :
default['sdk-install']['install']['sdk_bin_source']
default['sdk-install']['install']['sdk_bin_zip']
default['sdk-install']['install']['sdk_major_version']

Example Custom JSON:
{
  "sdk-install" : {
    "Install" : {
      "user" : "esbuser",
      "group" : "sgsup",
      "tibco_home_dir" : "/apps/tibco",
    }
  }
}


version 0.1.1 :
- Added new attributes for the product versions, and removed a few attributes including the sdk_home_dir. The home directory is now dynamically set.
- updated the directories and install recipes accordingly
- Added the libstdc++ installtion in install recipe.
