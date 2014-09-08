return unless node.recipe?('devops_consul::default')
include_recipe 'devops_consul'

devops_consul_service 'elasticsearch' do
  tags      node['elasticsearch']['consul']['tags']
end