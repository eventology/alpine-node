FROM docker.cosmunity.com/images/alpine-vips:latest
MAINTAINER Chance Hudson

COPY ./bootstrap.sh /bootstrap.sh

# Install nodejs and awscli
RUN apk add --no-cache nodejs-npm groff less python py-pip && \
  pip --no-cache-dir install awscli && \
  apk add --no-cache g++ make git ca-certificates curl && \
# Make entrypoint executable
  chmod +x /bootstrap.sh && \
# Make the src directory
  mkdir /src

WORKDIR /src

ONBUILD COPY . .
ONBUILD RUN mv ./.npmrc ~/.npmrc || true && \
# Install node modules
  npm install --production && \
# Remove depenencies
  rm -rf ~/.npmrc

ENTRYPOINT ["/bootstrap.sh"]
