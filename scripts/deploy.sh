#!/bin/bash

echo "Packaging Lambda function..."
cd consumer && zip -r ../consumer.zip . && cd ..

echo "Deploying to AWS..."
aws lambda update-function-code \
  --function-name stream-consumer \
  --zip-file fileb://consumer.zip

echo "Deployment complete"
