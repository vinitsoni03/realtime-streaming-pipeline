#!/bin/bash

STREAM_NAME="${KINESIS_STREAM_NAME:-vinit-data-stream-prod}"
REGION="${AWS_REGION:-ap-south-1}"

echo "Checking stream health: $STREAM_NAME"

stream_status=$(aws kinesis describe-stream \
  --stream-name "$STREAM_NAME" \
  --region "$REGION" \
  --query "StreamDescription.StreamStatus" \
  --output text)

if [ "$stream_status" = "ACTIVE" ]; then
    echo "Stream is healthy!"
    exit 0
else
    echo "Stream is not healthy: $stream_status"
    exit 1
fi
