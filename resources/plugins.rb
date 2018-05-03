#
# Cookbook:: kibana5
# Resource:: kibana5_plugins
#
# Copyright:: 2017, Parallels International GmbH
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

resource_name :kibana5_plugins

property :install_type, String, default: 'native'
property :url, String, default: ''

default_action :install

use_inline_resources if defined?(use_inline_resources)

action :install do
  service 'kibana' do
    action :nothing
  end

  case new_resource.install_type
  when 'native'
    execute "Install #{new_resource.name} Kibana plugin" do
      command "./kibana-plugin install #{new_resource.name}"
      cwd     "/opt/kibana/#{node['kibana5']['version']}/current/bin"
      user    node['kibana5']['service_user']
      notifies :restart, 'service[kibana]'
      not_if "/opt/kibana/#{node['kibana5']['version']}/current/bin/kibana-plugin list | grep #{new_resource.name}"
    end
  when 'url'
    execute "Install #{new_resource.name} Kibana plugin" do
      command "./kibana-plugin install #{new_resource.url}"
      cwd     "/opt/kibana/#{node['kibana5']['version']}/current/bin"
      user    node['kibana5']['service_user']
      notifies :restart, 'service[kibana]'
      not_if "/opt/kibana/#{node['kibana5']['version']}/current/bin/kibana-plugin list | grep #{new_resource.name}"
    end
  else
    Chef::Application.fatal!("Unknown install type: #{new_resource.install_type}")
  end
end
