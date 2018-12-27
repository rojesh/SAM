def lambda_handler(event:, context:)
  response_body = 'Hello, this is the API gateway test'
  {
    statusCode: 200,
    body: JSON.generate(response_body)
  }
end