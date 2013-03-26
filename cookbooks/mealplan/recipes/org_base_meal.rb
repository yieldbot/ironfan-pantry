name 'org_base'
description 'Attributes and recipes applied to EVERY node in the organization'

# Attributes applied if the node doesn't have it set already.
default_attributes({
  # Needed if you want to access S3 or the route53
  :aws => {
    :aws_access_key        => Chef::Config.knife[:aws_access_key_id],
    :aws_access_key_id     => Chef::Config.knife[:aws_access_key_id],
    :aws_secret_access_key => Chef::Config.knife[:aws_secret_access_key],
  },

  :route53      => { :zone      => 'test.chimpy.us' },

  :discovers => {
    :nfs        => 'control',
    :zabbix     => { :server => 'control' },
  },

  :zabbix => {
    :agent => {
      :unmonitor_on_shutdown => true
    }
  },

  :log_integration => {
    :flume_s3 => {
      :bucket_suffix => 'CUSTOMER-DOMAIN.chimpy.us',
    }
  },
})

override_attributes({
  :organization => Chef::Config[:organization]
  })

run_list(*%w[
])

serve_meal