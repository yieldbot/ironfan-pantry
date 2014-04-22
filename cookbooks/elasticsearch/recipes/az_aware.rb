# Add this recipe to the run list to make this node AZ aware
node.default[:elasticsearch][:custom_config] =  {'node.rack_id' => "#{node[:ec2][:placement_availability_zone]}"}
