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

property :version, String, default: ''
property :install_method, String, default: 'release'
property :base_dir, String, default: '/opt/kibana'
property :svc_user, String, default: ''
property :svc_group, String, default: ''

default_action :install

action :install do
  version = new_resource.version == '' ? node['kibana5']['version'] : new_resource.version
  svc_user = new_resource.svc_user == '' ? node['kibana5']['service_user'] : new_resource.svc_user
  svc_group = new_resource.svc_group == '' ? node['kibana5']['service_group'] : new_resource.svc_group
  install_method = new_resource.install_method

  distrib_url = kibana_artifact_url(version, install_method)
  distrib_checksum = kibana_artifact_checksum(version, install_method)

  install_dir = ::File.join(new_resource.base_dir, version)

  case install_method
  when 'release'
    group svc_group

    user svc_user do
      comment 'Kibana User'
      gid svc_group
      home new_resource.base_dir
      shell '/bin/bash'
      system true
    end

    directory install_dir do
      mode '0755'
      owner svc_user
      group svc_group
      recursive true
    end

    ark 'kibana' do
      url distrib_url
      version version
      checksum distrib_checksum
      path install_dir
      home_dir ::File.join(install_dir, 'current')
      owner svc_user
    end

    node.default['kibana5']['config_file'] = ::File.join(install_dir, 'current/config/kibana.yml')
    node.default['kibana5']['exec_file'] = ::File.join(install_dir, 'current/bin/kibana')
  else
    raise "Install method #{install_method} is not implemented yet!"
  end
end
