import json
import boto3
from consumer.transformer import transform_record
from consumer.dlq_handler import send_to_dlq


def lambda_handler(event, context):
    for record in event['Records']:
        try:
            payload = json.loads(record['kinesis']['data'])
            transformed = transform_record(payload)
            print(f"Processed: {transformed}")
        except Exception as e:
            print(f"Error processing record: {e}")
            send_to_dlq(record)

    return {'statusCode': 200}
