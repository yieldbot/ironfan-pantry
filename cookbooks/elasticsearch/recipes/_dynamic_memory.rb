#
# Cookbook Name:: elasticsearch
# Recipe:: _dynamic_memory
#
# Copyright 2014, Yieldbot
#
# All rights reserved - Do Not Redistribute
#

#### Overrides

# Quick lookups
es = node['elasticsearch']

# Get the total memory of the machine in megabytes
total_memory_mb = node['memory']['total'][0..-3].to_i / 1024

# Derive what we want to allocate to the JVM
jvm_total_mb = (total_memory_mb * es['dynamic_memory']['max_memory_allocation']).to_i

# If jvmTotalMb is less than the minimum threshold, abort the Chef run, as this machine is undersized for its purpose
fail 'Unable to dedicate required resources to the JVM.  Not enough memory available.' if jvm_total_mb < es['dynamic_memory']['min_memory_threshold']

# Overtide the attributes
node.override[:elasticsearch][:java_heap_size_min] = jvm_total_mb
node.override[:elasticsearch][:java_heap_size_max] = jvm_total_mb
