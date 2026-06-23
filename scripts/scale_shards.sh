#!/bin/bash

STREAM_NAME="${KINESIS_STREAM_NAME:-vinit-data-stream-prod}"
NEW_SHARD_COUNT="$1"

if [ -z "$NEW_SHARD_COUNT" ]; then
    echo "Usage: $0 <new-shard-count>"
    exit 1
fi

echo "Scaling stream $STREAM_NAME to $NEW_SHARD_COUNT shards..."

aws kinesis update-shard-count \
  --stream-name "$STREAM_NAME" \
  --target-shard-count "$NEW_SHARD_COUNT" \
  --scaling-type UNIFORM_SCALING
