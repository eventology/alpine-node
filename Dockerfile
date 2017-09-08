FROM docker.cosmunity.com/images/alpine-vips:latest
MAINTAINER Chance Hudson

COPY ./bootstrap.sh /bootstrap.sh

# Install nodejs and awscli
RUN apk add --no-cache nodejs-npm groff less python py-pip && \
  pip --no-cache-dir install awscli && \
# Make entrypoint executable
  chmod +x /bootstrap.sh && \
# Make the src directory
  mkdir /src

WORKDIR /src

ONBUILD COPY . .
ONBUILD RUN mv ./.npmrc ~/.npmrc || true && \
  apk add --no-cache --virtual .build-deps g++ make git ca-certificates curl && \
# Install node modules
  npm install --production && \
# Remove depenencies
  apk del .build-deps && \
  rm -rf ~/.npmrc

ENTRYPOINT ["/bootstrap.sh"]
