module Rolelike

  def run_list(*params)
    # The parameters for run_list are . . . inconsistent
    params = Array(params).flatten
    Chef::Log.info "rolelike - run_list: #{params}"
    params.each do |item|
      role = item[/^role\[(.*)\]/,1]
      item = "mealplan::#{role}_meal" unless role.nil?
      run_list_item item
    end
  end
  def run_list_item(item=nil)
    @_rolelike_run_list ||= Array.new
    @_rolelike_run_list << item if item
    @_rolelike_run_list
  end
  def serve_meal
    run_list_item.each {|item| include_recipe item }
  end

  def default_attributes(params)
    Chef::Log.info "rolelike - default_attributes: #{params}"
    node.default = Chef::Mixin::DeepMerge.deep_merge! params, node.default.to_hash
  end

  def override_attributes(params)
    Chef::Log.info "rolelike - override_attributes: #{params}"
    node.override = Chef::Mixin::DeepMerge.deep_merge! params, node.override.to_hash
  end

  def name(given)
    Chef::Log.info "rolelike - name: #{given}"
  end

  def description(given)
    Chef::Log.info "rolelike - description: #{given}"
  end
end

class Chef::Recipe              ; include Rolelike ; end

# class Chef::Mixin::Rolelike
# end
# 
# 