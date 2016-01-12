#
# Cookbook Name:: tra-install
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
include_recipe 'tra-install::users'
include_recipe 'tra-install::directories'
include_recipe 'tra-install::s3download'
include_recipe 'tra-install::responsefile'
include_recipe 'java'
include_recipe 'rv-install::default'
include_recipe 'tra-install::install'
