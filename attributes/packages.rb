#
# Cookbook:: kibana5
# Attribute:: packages
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

default['kibana5']['distribution']['base_url'] = 'https://artifacts.elastic.co/downloads/kibana'

default['kibana5']['distribution']['5.2.0'] = {
  'release' => {
    'x64' => {
      'url' => "#{node['kibana5']['distribution']['base_url']}/kibana-5.2.0-linux-x86_64.tar.gz",
      'checksum' => '729af8ab00f719f2038f6c499e508744b274487756e0214b660535ebead6f28a',
    },
    'x86' => {
      'url' => "#{node['kibana5']['distribution']['base_url']}/kibana-5.2.0-linux-x86.tar.gz",
      'checksum' => '9df75d2dc05937064f1ec905edc705ab1a83e8aaddef6b2fa90b2826f6cc2ea4',
    },
  },
  'windows' => {
    'x64' => {
      'url' => "#{node['kibana5']['distribution']['base_url']}/kibana-5.2.0-windows-x86.zip",
      'checksum' => 'bd1be9758b11b071bc033e9ed996598f4da6cdb18b28c475993c429f1c17db31',
    },
  },
}

default['kibana5']['distribution']['5.2.1'] = {
  'release' => {
    'x64' => {
      'url' => "#{node['kibana5']['distribution']['base_url']}/kibana-5.2.1-linux-x86_64.tar.gz",
      'checksum' => '82f06fc998385f08eac1c26bb0a48b29a34d179fdb7d0e8be216b35782f12bff',
    },
    'x86' => {
      'url' => "#{node['kibana5']['distribution']['base_url']}/kibana-5.2.1-linux-x86.tar.gz",
      'checksum' => 'c3f27b73e29a9b51a89b9b58798a0ea087df29978424255acb441a8b3e3540bf',
    },
  },
  'windows' => {
    'x64' => {
      'url' => "#{node['kibana5']['distribution']['base_url']}/kibana-5.2.1-windows-x86.zip",
      'checksum' => '8753db954a89a7a5c19a2c93886b523d1f8054bd31ce24c772bd873555a949d8',
    },
  },
}

default['kibana5']['distribution']['5.2.2'] = {
  'release' => {
    'x64' => {
      'url' => "#{node['kibana5']['distribution']['base_url']}/kibana-5.2.2-linux-x86_64.tar.gz",
      'checksum' => '9c7c526ce286da7f63aed9fb9f9d752ec182ff16bf374c55e55e5a0536a33563',
    },
    'x86' => {
      'url' => "#{node['kibana5']['distribution']['base_url']}/kibana-5.2.2-linux-x86.tar.gz",
      'checksum' => 'de0421728aca00e9d4114b45ad5519b843b700006eb0795fcc2df4371d6baa1d',
    },
  },
  'windows' => {
    'x64' => {
      'url' => "#{node['kibana5']['distribution']['base_url']}/kibana-5.2.2-windows-x86.zip",
      'checksum' => '8d6435aa6cfef1a8ce8d4a84361139d0ea3848abfe87283765b4da4fbaefdd3f',
    },
  },
}
