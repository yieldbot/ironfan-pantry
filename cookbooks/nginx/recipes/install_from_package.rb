#
# Cookbook Name::       install_from_package
# Description::         Installs nginx package from repository
# Recipe::              install_from_package
# Author::              Brandon Bell - Infochimps, Inc
#
# Copyright 2009, Opscode, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe 'yum::epel' if platform?('centos', 'redhat')

case node[:platform]
when "debian", "ubuntu"
  apt_repository "nginx" do
    uri "http://nginx.org/packages/ubuntu/"
    distribution "precise"
    components ["nginx"]
    key "http://nginx.org/keys/nginx_signing.key"
    action :add
  end

  package "nginx" do
    options "--force-yes"
  end
else
  package 'nginx'
end

