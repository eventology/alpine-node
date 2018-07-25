#! /bin/sh

set -e

if [ -n "$S3_CONFIG_PATH" ]; then
  echo "Downloading S3 config from $S3_CONFIG_PATH"
  aws s3 cp ${S3_CONFIG_PATH} ./ --recursive
else
  echo "No S3 config path supplied, skipping copy phase"
fi

if [ -n "$START_COMMAND" ]; then
  START_COMMAND=npm start
fi

exec ${START_COMMAND}
