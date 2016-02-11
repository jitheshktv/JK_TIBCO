#
# Cookbook Name:: rv-install
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

# version 0.1.2 : JK : Added the check for an explicit rv installation.
explicit_rvinstall_needed = node['rv-install']['install']['explicit_rvinstall_needed']

# Excute the recipes only if an explicit rv installation is required
if explicit_rvinstall_needed
  include_recipe 'rv-install::users'
  include_recipe 'rv-install::directories'
  include_recipe 'rv-install::s3download'
  include_recipe 'rv-install::responsefile'
  include_recipe 'java'
  include_recipe 'rv-install::install'
end
