name             'kibana5'
maintainer       'Azat Khadiev'
maintainer_email 'anuriq@gmail.com'
license          'Apache-2.0'
description      'Installs/Configures kibana 5'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '1.6.0'
issues_url       'https://github.com/anuriq/chef-kibana5/issues' if respond_to?(:issues_url)
source_url       'https://github.com/anuriq/chef-kibana5' if respond_to?(:source_url)

supports 'centos', '>= 7.0'
supports 'redhat', '>= 7.0'
supports 'ubuntu', '>= 16.04'

depends 'ark'
depends 'systemd', '>= 2.0'

chef_version '>= 12.1' if respond_to?(:chef_version)
