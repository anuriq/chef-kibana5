title 'Elasticsearch'

describe service('elasticsearch') do
  it { should be_enabled }
  it { should be_running }
end

describe port(9200) do
  it { should be_listening }
end

describe port(9300) do
  it { should be_listening }
end

describe command('curl -XGET http://127.0.0.1:9200/_cluster/health?pretty=true') do
  its(:exit_status) { should eq 0 }
  its(:stdout) { should match(/"number_of_nodes" : 1/) }
  its(:stdout) { should match(/"number_of_data_nodes" : 1/) }
end
