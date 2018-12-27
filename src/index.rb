require 'aws-sdk-dynamodb'
def lambda_handler(event:, context:)
  dynamodb = Aws::DynamoDB::Client.new(region: 'us-east-1')
  response = dynamodb.scan({
    table_name: ENV['table_name']
  })
  {
    statusCode: 200,
    body: JSON.generate(response.items)
  }
end