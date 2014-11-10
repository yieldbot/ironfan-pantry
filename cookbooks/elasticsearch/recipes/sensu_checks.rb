# Only process if we find the monitor cookbook in the run list
return unless node.recipe?('monitor::default')

# Bring in the necessary ruby dependencies
sensu_gem 'rest-client'

# Monitor the cluster status
sensu_check 'check-es-cluster-status' do
  command     "#{node['sensu']['directories']['base']}/plugins/sensu-yieldbot-plugins/elasticsearch/check-es-cluster-status.rb"
  handlers    ['devops-red']
  additional(
    :occurrences => 3
  )
  standalone  true
end

# Monitor the shard allocation status
sensu_check 'check-es-shard-allocation-status' do
  command     "#{node['sensu']['directories']['base']}/plugins/sensu-yieldbot-plugins/elasticsearch/check-es-shard-allocation-status.rb"
  handlers    ['devops-orange']
  standalone  true
end

# Add in the index duplicate monitoring checks if defined
sensu_check 'check-es-cluster-index' do
  cluster = "--cluster #{node[:elasticsearch][:sensu][:check_es_cluster_index][:servers].join(',')}" if node[:elasticsearch][:sensu][:check_es_cluster_index][:servers].length > 0
  ignore  = "--ignore #{node[:elasticsearch][:sensu][:check_es_cluster_index][:ignore].join(',')}" if node[:elasticsearch][:sensu][:check_es_cluster_index][:ignore].length > 0

  command     "#{node['sensu']['directories']['base']}/plugins/sensu-yieldbot-plugins/elasticsearch/check-es-indexes.rb #{cluster} #{ignore}"
  handlers    ['devops-red']
  standalone  true
end if node[:elasticsearch][:sensu][:check_es_cluster_index][:servers].length > 0
