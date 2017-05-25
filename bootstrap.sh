#! /bin/sh

set -e

if [ -n "$S3_CONFIG_PATH" ]; then
  echo "No S3 config path supplied, skipping copy phase"
else
  echo "Downloading S3 config from $S3_CONFIG_PATH"
  aws s3 cp ${S3_CONFIG_PATH} ./ --recursive
fi

exec npm start
