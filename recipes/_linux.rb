#
# Cookbook Name:: sensu
# Recipe:: _linux
#
# Copyright 2014, Sonian Inc.
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
return if node['packages']['sensu']

platform_family = node["platform_family"]
case platform_family
when "debian"
  remote_file '/tmp/sensu_1.4.2-4_amd64.deb' do
    source node['sensu']['ubuntu_package_url']
    owner 'root'
    group 'root'
    mode '0755'
    action :create
  end

  dpkg_package "sensu" do
    version node["sensu"]["version"]
    notifies :create, "ruby_block[sensu_service_trigger]"
    source '/tmp/sensu_1.4.2-4_amd64.deb'
  end

when "amazon"
    remote_file '/tmp/sensu-1.4.2-4.el6.x86_64.rpm' do
    source node['sensu']['aws_linux_2_package_url']
    owner 'root'
    group 'root'
    mode '0755'
    action :create
  end

  yum_package "sensu" do
    version "#{node["sensu"]["version"]}.el6"
    notifies :create, "ruby_block[sensu_service_trigger]"
    source '/tmp/sensu-1.4.2-4.el6.x86_64.rpm'
  end
end

template "/etc/default/sensu" do
  source "sensu.default.erb"
  notifies :create, "ruby_block[sensu_service_trigger]"
end
