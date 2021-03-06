# Add this recipe to the run list to make this node AZ aware
node.default[:elasticsearch][:custom_config] =  {
  # Set the rack_id to the availability zone
  'node.rack_id' => "#{node[:ec2][:placement_availability_zone]}",

  # Tell the awareness subsystem to utilize the rack_id attribute
  'cluster.routing.allocation.awareness.attributes' => 'rack_id'
}
