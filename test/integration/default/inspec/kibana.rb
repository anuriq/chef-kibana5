title 'Kibana'

describe user('kibana') do
  it { should exist }
end

describe service('kibana') do
  it { should be_enabled }
  it { should be_running }
end

describe port(5601) do
  it { should be_listening }
end

describe command('curl -I http://127.0.0.1:5601/app/kibana') do
  its(:stdout) { should match(%r{HTTP/1.1 200 OK}) }
  its(:stdout) { should match(/kbn-name: kibana/) }
  its(:stdout) { should match(/kbn-version: 5.2.0/) }
end
