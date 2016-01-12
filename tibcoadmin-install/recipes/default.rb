#
# Cookbook Name:: tibcoadmin-install
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
include_recipe 'tibcoadmin-install::users'
include_recipe 'tibcoadmin-install::directories'
include_recipe 'tibcoadmin-install::s3download'
include_recipe 'tibcoadmin-install::responsefile'
include_recipe 'java'
# Uncomment the below line to run rv and tra install before admin when testing this recipe alone using kitchen
# include_recipe 'rv-install::default'
# include_recipe 'tra-install::default'
include_recipe 'tibcoadmin-install::install'
