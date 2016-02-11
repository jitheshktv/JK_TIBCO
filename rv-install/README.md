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
default['rv-install']['install']['rv_bin_source']
default['rv-install']['install']['rv_bin_zip']
default['rv-install']['install']['rv_home_dir']

Example Custom JSON:
{
  "rv-install" : {
    "Install" : {
      "user" : "esbuser",
      "group" : "sgsup",
      "tibco_home_dir" : "/apps/tibco"
    }
  }
}

version : 0.1.1
- Removed the home rv_home_dir attribute with the rv_major_version, and dynamically set the home directory in the recipe.

Version 0.1.2 : JK : 02/10/2016
 -  Added a new recipe (libinstall) which will be executed prior to any other recipes, to install the GNU C++ libraries of other architecture (64 or 32) so that any binaries can be executed regardless of its architecture.
