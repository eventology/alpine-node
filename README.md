# alpine-node [![Build Status](https://travis-ci.org/eventology/alpine-node.svg?branch=master)](https://travis-ci.org/eventology/alpine-node)

The base node image for use in fan guru.

Includes nodejs, vips, awscli

Entrypoint copies the specified `S3_CONFIG_PATH` to the local directory then runs `npm start`
