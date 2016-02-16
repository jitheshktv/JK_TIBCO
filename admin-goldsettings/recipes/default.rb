#
# Cookbook Name:: hawk-goldsettings
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

include_recipe 'admin-goldsettings::tibcoadmin_tra'
include_recipe 'admin-goldsettings::restart_administrator'
