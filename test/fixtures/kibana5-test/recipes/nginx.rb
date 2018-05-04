# Install nginx and configure a primitive proxy to Kibana
node.default['nginx']['default_site_enabled'] = false
node.default['nginx']['repo_source'] = 'epel' if node['platform_family'] == 'rhel'
include_recipe 'nginx'

nginx_site 'kibana' do
  template 'nginx-site.conf.erb'
  variables(
    listen_address: '0.0.0.0',
    listen_port: '80',
    server_name: 'kibana.test',
    kibana_port: '5601'
  )
end
