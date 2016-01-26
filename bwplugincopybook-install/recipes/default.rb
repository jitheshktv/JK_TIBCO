#
# Cookbook Name:: bwplugincopybook-install
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
include_recipe 'bwplugincopybook-install::users'
include_recipe 'bwplugincopybook-install::directories'
include_recipe 'bwplugincopybook-install::s3download'
include_recipe 'bwplugincopybook-install::responsefile'
include_recipe 'java'
#### Uncomment the below line to run rv install before bwplugincopybook when testing this recipe alone using kitchen
# include_recipe 'rv-install::default'
# include_recipe 'tra-install::default'
# include_recipe 'bw-install::default'
include_recipe 'bwplugincopybook-install::install'
