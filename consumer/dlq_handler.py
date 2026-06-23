import os
import boto3
import json


def send_to_dlq(record):
    dlq_url = os.getenv('DLQ_URL')
    if not dlq_url:
        print("DLQ URL not set, skipping")
        return

    sqs = boto3.client('sqs')
    sqs.send_message(
        QueueUrl=dlq_url,
        MessageBody=json.dumps(record)
    )
