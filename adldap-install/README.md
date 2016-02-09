# adldap-install

This cookbook will install the TIBCO Adapter for LDAP on a linux based environment. The cookbook attributes are defaulted to install the ADLDAP version 6.1, with TIBCO_HOME as /apps/tibco, and LOGS_HOME as /logs/tibco. The binary will be downloaded from S3 (or any remote source), and user:group used for the installation and configuration is esbuser:sgsup. These attributes can be customized using Custom JSON, overriding the below attributes. The cookbook is dependent on Java cookbook, which is taken from the chef supermarket. ADLDAP also needs RV, TRA and BW installed prior to the installation.

For users and group :
default['adldap-install']['install']['group']
default['adldap-install']['install']['user']
default['adldap-install']['config']['group']
default['adldap-install']['config']['user']

For TIBCO_HOME and LOGS_HOME:
default['adldap-install']['install']['tibco_home_name']
default['adldap-install']['install']['tibco_home_dir']
default['adldap-install']['install']['logs_home_dir']

For the version of ADLDAP :
default['adldap-install']['install']['adldap_bin_source']
default['adldap-install']['install']['adldap_bin_zip']
default['adldap-install']['install']['adldap_major_version']

Example Custom JSON:
{
  "adldap-install" : {
    "Install" : {
      "user" : "esbuser",
      "group" : "sgsup",
      "tibco_home_dir" : "/apps/tibco",
    }
  }
}

version 0.1.1 :
- Replaced the adldap_home_dir attribute with adldap_major_version.
- Updated the directories and install recipe accordingly.
