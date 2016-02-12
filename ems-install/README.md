# ems-install

The cookbook to install the TIBCO EMS. The attributes are defauled to install EMS 8.2.2, however a custom JSON can be passed to override the default attributes. /apps/tibco is the default home directory.

default['ems-install']['install']['linux_bin_source'] = 'https://s3-us-west-2.amazonaws.com/ems-8.2.2-bin/linux/TIB_ems_8.2.2_linux_x86.zip'
default['ems-install']['install']['ems_major_version'] = '8.2'
default['ems-install']['config']['ems_config_dir'] = '/apps/tibco/config/ems'

example Custom JSON to install a different version
{
  "ems-install" : {
    "install" : {
      "linux_bin_source" : "https://s3-us-west-2.amazonaws.com/cate-3.3/ems/TIB_ems_6.3.0_linux26gl23_x86.zip",
      "ems_major_version" : "6.3"
    },
    "config" : {
      "ems_config_dir" : "/apps/tibco/config/ems"
    }
  }
}
