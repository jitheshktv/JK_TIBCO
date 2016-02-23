#
# Cookbook Name:: sdk-install
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
include_recipe 'sdk-install::users'
include_recipe 'sdk-install::directories'
include_recipe 'sdk-install::s3download'
include_recipe 'sdk-install::responsefile'
include_recipe 'java'
# Uncomment the below lines to run rv and tra install before admin when testing this recipe alone using kitchen
# include_recipe 'rv-install::default'
# include_recipe 'tra-install::default'
include_recipe 'sdk-install::install'
include_recipe 'sdk-install::postinstall'
