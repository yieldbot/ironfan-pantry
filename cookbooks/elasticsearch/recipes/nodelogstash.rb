#
# Cookbook Name:: elasticsearch
# Recipe:: default
#
# Copyright 2015, Yieldbot
#
# All rights reserved - Do Not Redistribute
#

#### Prereqs

#### node-logstash

include_recipe 'devops_nodelogstash::default'

#### Logstash Configuration

cluster_name = node[:elasticsearch][:realm]
log_dir      = node[:elasticsearch][:log_dir]

devops_nodelogstash_config "#{cluster_name}" do
  urls [
    "input://file://#{log_dir}/#{cluster_name}.log?type=elasticsearch",
    "filter://regex://?regex=\[([\s\S]+)\]\[(\S+)\]\[(\S+)\s*\] \[(\S+)\] ([\s\S]+)&date_format=YYYY-MM-DD HH:mm:ss,SSS&fields=@timestamp,loglevel,class,es_node,message"
  ]
end

devops_nodelogstash_config "#{cluster_name}_slowlog" do
  urls [
    "input://file://#{log_dir}/#{cluster_name}_index_search_slowlog.log?type=elasticsearch_slowlog",
    "filter://regex://?only_type=elasticsearch_slowlog&regex=\[([\s\S]+)\]\[(\S+)\]\[(\S+)\s*\] \[(\S+)\] \[(\S+)\]\[(\d{1})\] took\[(\S+)\], took_millis\[(\d+)\], types\[(\S*)\], stats\[(\S*)\], search_type\[(\S+)\], total_shards\[(\d+)\], source\[([\s\S]*)\], extra_source\[(\S*)\]&date_format=YYYY-MM-DD HH:mm:ss,SSS&fields=@timestamp,loglevel,class,es_node,index,shard,took,took_ms,types,stats,search_type,total_shards,query_source,extra_source"
  ]
end
