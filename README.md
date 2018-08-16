# alpine-node [![Build Status](https://travis-ci.com/eventology/alpine-node.svg?token=Pz62t27i4ngVwMxU3DsS&branch=master)](https://travis-ci.com/eventology/alpine-node)

The base node image for use in fan guru.

Includes nodejs, vips, awscli

Entrypoint copies the specified `S3_CONFIG_PATH` to the local directory then runs `npm start`
