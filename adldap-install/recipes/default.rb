#
# Cookbook Name:: adldap-install
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
include_recipe 'adldap-install::users'
include_recipe 'adldap-install::directories'
include_recipe 'adldap-install::s3download'
include_recipe 'adldap-install::responsefile'
include_recipe 'java'
# Uncomment the below line to run rv install before adldap when testing this recipe alone using kitchen
# include_recipe 'rv-install::default'
include_recipe 'adldap-install::install'
