#!/bin/bash

STREAM_NAME="${KINESIS_STREAM_NAME:-vinit-data-stream-prod}"
REGION="${AWS_REGION:-ap-south-1}"

echo "Setting up CloudWatch alarms for stream: $STREAM_NAME"

# Alarm for iterator age
aws cloudwatch put-metric-alarm \
  --alarm-name "${STREAM_NAME}-iterator-age" \
  --alarm-description "Alarm when iterator age exceeds 60 seconds" \
  --metric-name "GetRecords.IteratorAgeMilliseconds" \
  --namespace "AWS/Kinesis" \
  --statistic "Maximum" \
  --period 60 \
  --threshold 60000 \
  --comparison-operator "GreaterThanThreshold" \
  --evaluation-periods 2 \
  --dimensions "Name=StreamName,Value=${STREAM_NAME}" \
  --region "${REGION}"

echo "Alarms created"
