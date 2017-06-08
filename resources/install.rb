#
# Cookbook:: kibana5
# Resource:: kibana5_install
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

resource_name :kibana5_install

property :name, String, name_property: true
property :version, String, default: '5.4.1'
property :install_method, String, default: 'release'
property :base_dir, String, default: '/opt/kibana'
property :svc_user, String, default: node['kibana5']['service_user']
property :svc_group, String, default: node['kibana5']['service_group']

default_action :install

action :install do
  version = new_resource.version
  install_dir = ::File.join(new_resource.base_dir, version)

  group new_resource.svc_group

  user new_resource.svc_user do
    comment 'Kibana User'
    gid new_resource.svc_group
    home new_resource.base_dir
    shell '/bin/bash'
    system true
  end

  directory install_dir do
    mode '0755'
    owner new_resource.svc_user
    group new_resource.svc_group
    recursive true
  end

  case install_method
  when 'release'
    if node['kernel']['machine'] == 'x86_64'
      url = node['kibana5']['distribution'][version]['release']['x64']['url']
      checksum = node['kibana5']['distribution'][version]['release']['x64']['checksum']
    else
      url = node['kibana5']['distribution'][version]['release']['x86']['url']
      checksum = node['kibana5']['distribution'][version]['release']['x86']['checksum']
    end

    ark 'kibana' do
      url url
      version version
      checksum checksum
      path install_dir
      home_dir ::File.join(install_dir, 'current')
      owner new_resource.svc_user
    end

    node.default['kibana5']['config_file'] = ::File.join(install_dir, 'current/config/kibana.yml')
    node.default['kibana5']['exec_file'] = ::File.join(install_dir, 'current/bin/kibana')
  else
    raise 'Currently only release method is supported'
  end
end
