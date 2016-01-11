#
# Cookbook Name:: rv-install
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

include_recipe 'rv-install::users'
include_recipe 'rv-install::directories'
include_recipe 'rv-install::s3download'
include_recipe 'rv-install::responsefile'
include_recipe 'java'
include_recipe 'rv-install::install'
