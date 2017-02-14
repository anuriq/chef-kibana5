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

base_url = 'https://artifacts.elastic.co/downloads/kibana'
default['kibana5']['distribution'] = {
  '5.2.0' => {
    'release' => {
      'x64' => {
        'url' => "#{base_url}/kibana-5.2.0-linux-x86_64.tar.gz",
        'checksum' => '729af8ab00f719f2038f6c499e508744b274487756e0214b660535ebead6f28a',
      },
      'x86' => {
        'url' => "#{base_url}/kibana-5.2.0-linux-x86.tar.gz",
        'checksum' => '9df75d2dc05937064f1ec905edc705ab1a83e8aaddef6b2fa90b2826f6cc2ea4',
      },
    },
    'windows' => {
      'x64' => {
        'url' => "#{base_url}/kibana-5.2.0-windows-x86.zip",
        'checksum' => 'bd1be9758b11b071bc033e9ed996598f4da6cdb18b28c475993c429f1c17db31',
      },
    },
  },
}
