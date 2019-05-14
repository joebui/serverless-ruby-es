require 'json'
require 'elasticsearch'

def wipe_log(event:, context:)
  body = JSON.parse(event['body'])

  client = Elasticsearch::Client.new url: ENV['ES_HOST'], log: ENV['ENV'] == 'development'
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
