[![CircleCI](https://circleci.com/gh/eventology/alpine-node.svg?style=shield&circle-token=2f6f17610189bbcdf08b1e0c6ba703d81fc6810d)](https://circleci.com/gh/eventology/alpine-node)
# alpine-node

The base node image for use in fan guru.

Includes nodejs, vips, awscli

Entrypoint copies the specified `S3_CONFIG_PATH` to the local directory then runs `npm start`
