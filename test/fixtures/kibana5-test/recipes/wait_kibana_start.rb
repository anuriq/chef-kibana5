# Kibana takes some time to start. Tests should not be executed immediately.
execute 'wait for kibana to start' do
  command 'sleep 15'
end
