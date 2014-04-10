# Only process if we find the monitor cookbook in the run list
return unless node.recipe?('monitor::default')

# Bring in the necessary ruby dependencies
sensu_gem 'rest-client'

# Monitor the cluster status
sensu_check 'check-es-server-cluster-status' do
  command   "#{node['sensu']['directories']['base']}/plugins/sensu-community-plugins/elasticsearch/check-es-cluster-status.rb"
  standalone    true
end

# TODO: Calculate the warning/critical heap bytes based off of the current number of bytes allocated to the JVM

# # Monitor the cluster JVM heap
# sensu_check 'check-es-heap' do
#   command   "#{node['sensu']['directories']['base']}/plugins/sensu-community-plugins/elasticsearch/check-es-heap.rb -w #{warning} -c #{critical}"
#   standalone    true
# end
