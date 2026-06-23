#!/bin/bash

LOG_GROUP="/aws/lambda/stream-consumer"

echo "Tailing logs from $LOG_GROUP..."

aws logs tail "$LOG_GROUP" --follow
