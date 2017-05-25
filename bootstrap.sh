#! /bin/sh

set -e

aws s3 cp ${S3_CONFIG_PATH} ./ --recursive

exec npm start
