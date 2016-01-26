#
# Cookbook Name:: bwpluginrestjson-install
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
include_recipe 'bwpluginrestjson-install::users'
include_recipe 'bwpluginrestjson-install::directories'
include_recipe 'bwpluginrestjson-install::s3download'
include_recipe 'bwpluginrestjson-install::responsefile'
include_recipe 'java'
# Uncomment the below line to run rv install before bwpluginrestjson when testing this recipe alone using kitchen
# include_recipe 'rv-install::default'
# include_recipe 'tra-install::default'
# include_recipe 'bw-install::default'
include_recipe 'bwpluginrestjson-install::install'
