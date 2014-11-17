#
# Cookbook Name:: mackerel_setting_sample
# Recipe:: default
#
# Copyright (c) 2014 The Authors, All Rights Reserved.
#

node.set_unless['mackerel-agent']['conf']['apikey'] = ::APIHelper.collect_api_key
node.set_unless['mackerel-agent']['conf']['roles'] = [node.chef_environment, node.roles].flatten

include_recipe 'mackerel-agent::default'
