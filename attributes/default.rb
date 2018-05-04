#
# Cookbook:: kibana5
# Attribute:: default
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

# To override source of Kibana distribution use this, otherwise leave intact
default['kibana5']['url'] = nil
default['kibana5']['checksum'] = nil

default['kibana5']['version'] = '5.6.9'
default['kibana5']['distribution_base_url'] = 'https://artifacts.elastic.co/downloads/kibana'
default['kibana5']['service_user'] = 'kibana'
default['kibana5']['service_group'] = 'kibana'

default['kibana5']['config']['server.port'] = 5601
default['kibana5']['config']['server.host'] = 'localhost'
default['kibana5']['config']['elasticsearch.url'] = 'http://localhost:9200'
default['kibana5']['config']['logging.dest'] = '/var/log/kibana.log'
