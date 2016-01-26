#
# Cookbook Name:: hawk-install
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
include_recipe 'hawk-install::users'
include_recipe 'hawk-install::directories'
include_recipe 'hawk-install::s3download'
include_recipe 'hawk-install::responsefile'
include_recipe 'java'
# Uncomment the below line to run rv install before hawk when testing this recipe alone using kitchen
# include_recipe 'rv-install::default'
include_recipe 'hawk-install::install'
