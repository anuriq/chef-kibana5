# Install nginx and configure a primitive proxy to Kibana
node.default['nginx']['default_site_enabled'] = false
include_recipe 'chef_nginx'

nginx_site 'kibana' do
  template 'nginx-site.conf.erb'
  variables(
    listen_address: '0.0.0.0',
    listen_port: '80',
    server_name: 'kibana.test',
    kibana_port: '5601'
  )
end
