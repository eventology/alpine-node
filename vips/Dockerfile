FROM alpine:edge
MAINTAINER Chance Hudson

COPY ./bootstrap.sh /bootstrap.sh

# Install nodejs and awscli
RUN apk add --no-cache nodejs-npm groff less python py-pip vips && \
  pip --no-cache-dir install awscli && \
  apk add --no-cache g++ make git ca-certificates curl && \
# Make entrypoint executable
  chmod +x /bootstrap.sh && \
# Make the src directory
  mkdir /src

WORKDIR /src

ENTRYPOINT ["/bootstrap.sh"]
