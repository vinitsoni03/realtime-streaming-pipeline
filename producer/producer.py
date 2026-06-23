import os
import boto3
import json
import time
from producer.config import STREAM_NAME, REGION


def get_kinesis_client():
    return boto3.client('kinesis', region_name=REGION)


def send_record(data, partition_key):
    kinesis = get_kinesis_client()
    response = kinesis.put_record(
        StreamName=STREAM_NAME,
        Data=json.dumps(data),
        PartitionKey=partition_key
    )
    return response


def produce_messages(count=10):
    for i in range(count):
        data = {
            'id': i,
            'timestamp': time.time(),
            'message': f'Test message {i}'
        }
        partition_key = str(i % 2)
        response = send_record(data, partition_key)
        print(f"Sent record {i}: {response['SequenceNumber']}")
        time.sleep(0.1)


if __name__ == "__main__":
    produce_messages()
