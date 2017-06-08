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

describe file('/var/log/kibana.log') do
  it { should be_file }
  it { should be_owned_by 'kibana' }
  it { should be_grouped_into 'kibana' }
  its('mode') { should cmp '0644' }
end
