#
# Cookbook Name:: bw-install
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
include_recipe 'bw-install::users'
include_recipe 'bw-install::directories'
include_recipe 'bw-install::s3download'
include_recipe 'bw-install::responsefile'
include_recipe 'java'
# Uncomment the below lines to run rv and tra install before admin when testing this recipe alone using kitchen
# include_recipe 'rv-install::default'
# include_recipe 'tra-install::default'
include_recipe 'bw-install::install'
include_recipe 'bw-install::postinstall'
