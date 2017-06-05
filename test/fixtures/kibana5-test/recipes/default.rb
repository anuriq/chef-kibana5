
node.default['java']['oracle']['accept_oracle_download_terms'] = true
node.default['java']['jdk_version'] = 8
node.default['java']['install_flavor'] = 'oracle'
include_recipe 'java'

elasticsearch_user 'elasticsearch'

elasticsearch_install 'elasticsearch' do
  type 'package'
  version '5.4.1'
end

elasticsearch_configure 'elasticsearch'

elasticsearch_service 'elasticsearch'

service 'elasticsearch' do
  supports status: true, restart: true, reload: true
  action [:start]
end

include_recipe 'kibana5'
