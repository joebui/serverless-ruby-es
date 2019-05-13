require 'json'
require 'elasticsearch'

def hello(event:, context:)
  is_development_env = ENV['ENV'] == 'development'
  body = is_development_env ? event['body'] : JSON.parse(event['body'])

  client = Elasticsearch::Client.new url: ENV['ES_HOST'], log: is_development_env
  search = client.search(
    index: 'logstash-*',
    body: {
      query: {
        bool: {
          should: [
            {
              terms: {
                user_id: body['user_ids']
              }
            },
            {
              terms: {
                'params.user_id': body['user_ids']
              }
            }
          ]
        }
      }
    }
  )
  search_result = search['hits']['hits']

  {
    statusCode: 200,
    body: JSON.generate(
      search_result: search_result,
      count: search_result.count
    )
  }
end
