#
# Cookbook Name:: ems-createinstance
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

# include_recipe 'ems-install'
include_recipe 'ems-createinstance::users'
include_recipe 'ems-createinstance::directories'
include_recipe 'ems-createinstance::prepareconfig'
include_recipe 'ems-createinstance::copycerts'
include_recipe 'ems-createinstance::startinstance'
