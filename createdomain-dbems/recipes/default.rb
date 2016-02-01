#
# Cookbook Name:: createdomain-dbems
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

include_recipe 'createdomain-dbems::commandfilexml'
include_recipe 'createdomain-dbems::tnsfile'
# Commenting the below as there are seperate Cookbooks for those.
# include_recipe 'createdomain-dbems::installemsclient'
# include_recipe 'createdomain-dbems::installdbclient'
include_recipe 'createdomain-dbems::domainutility'
