#
# Cookbook Name:: ems-install
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

include_recipe 'ems-install::users'
include_recipe 'ems-install::directories'
include_recipe 'ems-install::s3download'
include_recipe 'ems-install::responsefile'
include_recipe 'java'
include_recipe 'ems-install::installems'
