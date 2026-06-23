import os

STREAM_NAME = os.getenv('KINESIS_STREAM_NAME', 'vinit-data-stream-prod')
REGION = os.getenv('AWS_REGION', 'ap-south-1')
BATCH_SIZE = 10
