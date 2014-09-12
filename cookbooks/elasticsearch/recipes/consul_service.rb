include_recipe 'devops_consul::default'

devops_consul_service 'elasticsearch' do
  tags          node['elasticsearch']['consul']['tags']
  port          9200
  create_check  true
  type          'interval'
  interval      '10s'
  script        'curl localhost:9200 >/dev/null 2>&1'
end
