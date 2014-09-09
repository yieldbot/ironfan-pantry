include_recipe 'devops_consul::default'

devops_consul_service 'zookeeper' do
  tags      node['zookeeper']['consul']['tags']
  port      2181
end