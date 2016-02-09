# bwpluginrestjson-install

This cookbook will install the TIBCO BW Plugin for RESTJSON on a linux based environment. The cookbook attributes are defaulted to install the RESTJSON plugin 2.0 version 6.1, with TIBCO_HOME as /apps/tibco, and LOGS_HOME as /logs/tibco. The binary will be downloaded from S3 (or any remote source), and user:group used for the installation and configuration is esbuser:sgsup. These attributes can be customized using Custom JSON, overriding the below attributes. The cookbook is dependent on Java cookbook, which is taken from the chef supermarket. The RESTJSON plugin also needs RV, TRA and BW installed prior to the installation.

For users and group :
default['bwpluginrestjson-install']['install']['group']
default['bwpluginrestjson-install']['install']['user']
default['bwpluginrestjson-install']['config']['group']
default['bwpluginrestjson-install']['config']['user']

For TIBCO_HOME and LOGS_HOME:
default['bwpluginrestjson-install']['install']['tibco_home_name']
default['bwpluginrestjson-install']['install']['tibco_home_dir']
default['bwpluginrestjson-install']['install']['logs_home_dir']

For the version of RESTJSON plugin :
default['bwpluginrestjson-install']['install']['bwpluginrestjson_bin_source']
default['bwpluginrestjson-install']['install']['bwpluginrestjson_bin_zip']

Example Custom JSON:
{
  "bwpluginrestjson-install" : {
    "Install" : {
      "user" : "esbuser",
      "group" : "sgsup",
      "tibco_home_dir" : "/apps/tibco",
    }
  }
}

version 0.1.1 :
- Added README.
- Deleted the below attribute restjsonplugin_jar, to dynamically set it in the install recipe based on tibco_install_dir.
