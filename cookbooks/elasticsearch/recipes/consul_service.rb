include_recipe 'devops_consul::default'

devops_consul_service 'elasticsearch' do
  tags      node['elasticsearch']['consul']['tags']
  port      9200
  notifies  :create, 'ruby_block[consul_service_restart_trigger]', :delayed if node['devops_consul']['agent']['auto_restart_services']
end