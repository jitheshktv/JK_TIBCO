default['hawk-install']['install']['group'] = 'sgsup'
default['hawk-install']['install']['user'] = 'esbuser'
default['hawk-install']['config']['group'] = 'sgsup'
default['hawk-install']['config']['user'] = 'esbuser'

default['hawk-install']['install']['tibco_home_name'] = 'TIBCO_HOME'
default['hawk-install']['install']['tibco_home_dir'] = '/apps/tibco'
default['hawk-install']['install']['logs_home_dir'] = '/logs/tibco'
default['hawk-install']['install']['tibco_install_dir'] = '/apps/tibco'
default['hawk-install']['install']['tibco_instance_dir'] = '/apps/tibco'
default['hawk-install']['install']['logs_instance_dir'] = '/logs/tibco'
default['hawk-install']['install']['tibcojre_home_dir'] = '/apps/tibco/tibcojre/1.8.0'

default['hawk-install']['install']['hawk_bin_source'] = 'https://s3-us-west-2.amazonaws.com/hawk-5.1.1-bin/linux/TIB_hawk_5.1.1_linux26gl23_x86.zip'
default['hawk-install']['install']['hawk_major_version'] = '5.1'

default['hawk-install']['install']['hawk_bin_target_path'] = '/tmp/hawk'
default['hawk-install']['install']['hawk_bin_zip'] = 'TIB_hawk.zip'
default['hawk-install']['install']['tibco_universalinstaller_bin'] = 'TIBCOUniversalInstaller-lnx-x86.bin'
default['hawk-install']['install']['response_file'] = 'hawkInstallResponseFile.silent'
# version 0.1.1 : JK : removed the below attribute with the hawk_major_version
# default['hawk-install']['install']['hawk_home_dir'] = '/apps/tibco/hawk/5.1'

default['hawk-install']['install']['tomcat_port'] = '8080'
default['hawk-install']['install']['tomcat_shutdown_port'] = '8081'
default['hawk-install']['install']['tomcat_user_name'] = 'admin'
default['hawk-install']['install']['tomcat_user_password'] = 'admin'

default['java']['install_flavor'] = 'oracle'
default['java']['jdk_version'] = '8'
default['java']['java_home'] = '/opt/jre'
default['java']['set_etc_environment'] = 'true'
default['java']['oracle']['accept_oracle_download_terms'] = 'true'
