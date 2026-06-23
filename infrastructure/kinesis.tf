provider "aws" {
  region = "ap-south-1"
}

resource "aws_kinesis_stream" "data_stream" {
  name             = "vinit-data-stream-prod"
  shard_count      = 2
  retention_period = 24

  tags = {
    Name = "Realtime Data Stream"
  }
}
