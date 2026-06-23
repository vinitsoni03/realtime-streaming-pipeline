import os
import json
import boto3


def write_to_s3(data, bucket, key):
    s3 = boto3.client('s3')
    s3.put_object(
        Bucket=bucket,
        Key=key,
        Body=json.dumps(data)
    )
