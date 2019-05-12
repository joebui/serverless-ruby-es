require 'json'
require 'elasticsearch'

def hello(event:, context:)
  client = Elasticsearch::Client.new url: ENV['ES_HOST'], log: ENV['ENV'] == 'development'
  search = client.search(
    index: 'logstash-*',
    body: {
      query: {
        bool: {
          should: [
            {
              terms: {
                user_id: [1, 2, 3, 4, 5]
              }
            },
            {
              terms: {
                'params.user_id': [1, 2, 3, 4, 5]
              }
            }
          ]
        }
      }
    }
  )

  if ENV['ENV'] == 'development'
    {
      search_result: search['hits']['hits'],
      count: search['hits']['hits'].count
    }
  else
    {
      statusCode: 200,
      body: JSON.generate(
        search_result: search['hits']['hits'],
        count: search['hits']['hits'].count
      )
    }
  end
end
