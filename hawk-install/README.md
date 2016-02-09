# hawk-install

This cookbook will install the TIBCO Hawk on a linux based environment. The cookbook attributes are defaulted to install the Hawk version 5.1, with TIBCO_HOME as /apps/tibco, and LOGS_HOME as /logs/tibco. The binary will be downloaded from S3 (or any remote source), and user:group used for the installation and configuration is esbuser:sgsup. These attributes can be customized using Custom JSON, overriding the below attributes. The cookbook is dependent on Java cookbook, which is taken from the chef supermarket. Hawk also needs RV, and TRA installed prior to the installation.

For users and group :
default['hawk-install']['install']['group']
default['hawk-install']['install']['user']
default['hawk-install']['config']['group']
default['hawk-install']['config']['user']

For TIBCO_HOME and LOGS_HOME:
default['hawk-install']['install']['tibco_home_name']
default['hawk-install']['install']['tibco_home_dir']
default['hawk-install']['install']['logs_home_dir']

For the version of HAWK :
default['hawk-install']['install']['hawk_bin_source']
default['hawk-install']['install']['hawk_bin_zip']
default['hawk-install']['install']['hawk_major_version']

Example Custom JSON:
{
  "hawk-install" : {
    "Install" : {
      "user" : "esbuser",
      "group" : "sgsup",
      "tibco_home_dir" : "/apps/tibco",
    }
  }
}

version 0.1.1 :
- Added new attributes for the product versions, and removed a few attributes including the hawk_home_dir. The home directory is now dynamically set.
- directories and install recipes are modified accordingly.
- Updated README
