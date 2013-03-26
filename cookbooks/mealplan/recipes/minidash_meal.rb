name        'minidash'
description 'Runs a mini dashboard for the machine'

run_list *%w[
  minidash::server
  ]

Chef::Log.info " - default[:users] = #{node.default.to_hash['users']}"

serve_meal