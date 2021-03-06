default['sdk-install']['install']['group'] = 'sgsup'
default['sdk-install']['install']['user'] = 'esbuser'
default['sdk-install']['config']['group'] = 'sgsup'
default['sdk-install']['config']['user'] = 'esbuser'

default['sdk-install']['install']['tibco_home_name'] = 'TIBCO_HOME'
default['sdk-install']['install']['tibco_home_dir'] = '/apps/tibco'
default['sdk-install']['install']['logs_home_dir'] = '/logs/tibco'
default['sdk-install']['install']['tibco_install_dir'] = '/apps/tibco'
default['sdk-install']['install']['tibco_instance_dir'] = '/apps/tibco'
default['sdk-install']['install']['logs_instance_dir'] = '/logs/tibco'

default['sdk-install']['install']['sdk_bin_source'] = 'https://s3-us-west-2.amazonaws.com/sdk-5.8.0-bin/linux/TIB_sdk_5.8.0_linux24gl23_x86.zip'
default['sdk-install']['install']['sdk_major_version'] = '5.8'

default['sdk-install']['install']['sdk_bin_target_path'] = '/tmp/sdk'
default['sdk-install']['install']['sdk_bin_zip'] = 'TIB_sdk.zip'
default['sdk-install']['install']['tibco_universalinstaller_bin'] = 'TIBCOUniversalInstaller-lnx-x86.bin'
default['sdk-install']['install']['response_file'] = 'sdkInstallResponseFile.silent'
# version 0.1.1 : JK : Replaced the home directory attribute with major version attribute
# default['sdk-install']['install']['sdk_home_dir'] = '/apps/tibco/adapter/sdk/5.8'

default['java']['install_flavor'] = 'oracle'
default['java']['jdk_version'] = '8'
default['java']['java_home'] = '/opt/jre'
default['java']['set_etc_environment'] = 'true'
default['java']['oracle']['accept_oracle_download_terms'] = 'true'
