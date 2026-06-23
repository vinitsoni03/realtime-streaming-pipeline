resource "aws_lambda_function" "stream_consumer" {
  filename      = "consumer.zip"
  function_name = "stream-consumer"
  role          = aws_iam_role.lambda_execution.arn
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.11"
}

resource "aws_lambda_event_source_mapping" "kinesis_mapping" {
  event_source_arn = aws_kinesis_stream.data_stream.arn
  function_name    = aws_lambda_function.stream_consumer.arn
  starting_position = "LATEST"
}
