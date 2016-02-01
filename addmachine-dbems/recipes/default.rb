#
# Cookbook Name:: addmachine-dbems
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

include_recipe 'addmachine-dbems::commandfilexml'
include_recipe 'addmachine-dbems::tnsfile'
# Commenting below as there is a new cookbook for client installation
# include_recipe 'addmachine-dbems::installemsclient'
# include_recipe 'addmachine-dbems::installdbclient'
include_recipe 'addmachine-dbems::domainutility'
