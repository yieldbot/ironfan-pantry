include_recipe 'devops_consul::default'

devops_consul_service 'elasticsearch' do
  tags      node['elasticsearch']['consul']['tags']
  port      9200
end