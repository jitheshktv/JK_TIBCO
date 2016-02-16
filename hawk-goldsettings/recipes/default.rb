#
# Cookbook Name:: hawk-goldsettings
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

include_recipe 'hawk-goldsettings::hawkagent_cfg'
include_recipe 'hawk-goldsettings::hawkagent_tra'
include_recipe 'hawk-goldsettings::restart_hawkagent'
