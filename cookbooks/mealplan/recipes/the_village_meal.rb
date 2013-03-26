name        'the_village'
description 'These are all of the things that trogdor burns onto an AMI'

run_list %w[
java

users::ubuntu

ant
boost
build-essential
emacs
git
jruby
jruby::gems
nodejs
ntp
openssl
pig::install_from_release
hadoop_cluster::add_cloudera_repo
runit
thrift
xfs
xml
zlib
zsh

role[package_set]
]

override_attributes({
  :java           => { :install_flavor => 'oracle_via_webupd8' },
  :package_set    => { :install   => %w[ base dev sysadmin text python emacs ] },
  :apt            => { :cloudera  => { :force_distro => 'maverick',  }, },
})

Chef::Log.info " - node['java']['install_flavor'] = #{node['java']['install_flavor']}"
Chef::Log.info " - default['java']['install_flavor'] = #{node.default['java']['install_flavor']}"
Chef::Log.info " - override['java']['install_flavor'] = #{node.override['java']['install_flavor']}"
serve_meal
raise 'hell'
