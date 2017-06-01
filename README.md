# alpine-node

[![build status](https://gitlab.cosmunity.com/images/alpine-node/badges/master/build.svg)](https://gitlab.cosmunity.com/images/alpine-node/commits/master)

The base node image for use in cosmunity.

Includes nodejs, vips, awscli

Entrypoint copies the specified `S3_CONFIG_PATH` to the local directory the runs `npm start`
