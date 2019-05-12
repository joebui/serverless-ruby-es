task :deploy do
  if system 'bundle install --quiet --deployment --without test development'
    system 'sls deploy'
    system 'rm -rf vendor'
    system 'bundle install'
  end
end

task :dev_build do
  system 'bundle install'
end

task :add_mock_data do
  require 'elasticsearch'
  client = Elasticsearch::Client.new url: ENV['ES_HOST']
  client.index index: 'logstash-2019.05.01', type: 'mytype', id: 1, body: { title: 'Test', user_id: 1 }
  client.index index: 'logstash-2019.05.02', type: 'mytype', id: 2, body: { title: 'Test', params: { user_id: 1 } }
  client.index index: 'logstash-2019.05.01', type: 'mytype', id: 3, body: { title: 'Test', user_id: 2 }
  client.index index: 'logstash-2019.05.02', type: 'mytype', id: 4, body: { title: 'Test', params: { user_id: 2 } }
end
