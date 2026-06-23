resource "aws_cloudwatch_log_group" "lambda_logs" {
  name              = "/aws/lambda/stream-consumer"
  retention_in_days = 30
}
