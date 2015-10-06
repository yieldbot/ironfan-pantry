# Only process if we find the monitor cookbook in the run list
return unless node.recipe?('monitor::default')

# Add in the index duplicate monitoring checks if defined
sensu_check 'check-es-cluster-index' do
  cluster = "--cluster #{node[:elasticsearch][:sensu][:check_es_cluster_index][:servers].join(',')}" if node[:elasticsearch][:sensu][:check_es_cluster_index][:servers].length > 0
  ignore  = "--ignore #{node[:elasticsearch][:sensu][:check_es_cluster_index][:ignore].join(',')}" if node[:elasticsearch][:sensu][:check_es_cluster_index][:ignore].length > 0

  command     "#{node['sensu']['directories']['base']}/plugins/sensu-yieldbot-plugins/elasticsearch/check-es-indexes.rb #{cluster} #{ignore}"
  handlers    node[:elasticsearch][:sensu][:handler_red]
  standalone  true
end if node[:elasticsearch][:sensu][:check_es_cluster_index][:servers].length > 0
