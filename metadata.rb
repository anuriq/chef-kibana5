name             'kibana5'
maintainer       'Parallels International GmbH'
maintainer_email 'akhadiev@parallels.com'
license          'Apache 2.0'
description      'Installs/Configures kibana 5'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'
issues_url       'https://github.com/anuriq/chef-kibana5/issues' if respond_to?(:issues_url)
source_url       'https://github.com/anuriq/chef-kibana5' if respond_to?(:source_url)

supports 'centos', '>= 7'
supports 'redhat', '>= 7'

depends 'ark'
depends 'systemd'
