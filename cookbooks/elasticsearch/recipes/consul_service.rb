include_recipe 'devops_consul::default'

devops_consul_service 'elasticsearch' do
  tags      node['elasticsearch']['consul']['tags']
end
