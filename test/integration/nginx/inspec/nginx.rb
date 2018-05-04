title 'Nginx'

describe service('nginx') do
  it { should be_enabled }
  it { should be_running }
end

describe port(80) do
  it { should be_listening }
end

describe command('curl -I http://127.0.0.1/app/kibana') do
  its(:stdout) { should match(%r{HTTP/1.1 200 OK}) }
  its(:stdout) { should match(/kbn-name: kibana/) }
  its(:stdout) { should match(/kbn-version: 5.6.9/) }
end
