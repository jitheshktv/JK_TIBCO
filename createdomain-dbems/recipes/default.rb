#
# Cookbook Name:: createdomain-dbems
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

include_recipe 'createdomain-dbems::commandfilexml'
include_recipe 'createdomain-dbems::tnsfile'
include_recipe 'createdomain-dbems::installemsclient'
include_recipe 'createdomain-dbems::domainutility'
