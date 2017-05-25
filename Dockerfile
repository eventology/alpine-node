FROM alpine:latest
MAINTAINER Chance Hudson

# Download tarball - downloading from http, verify the checksum
ENV VIPS="vips-8.4.5"
ENV VIPS_SHA1="c14cedb175836f6f877689d1cbf9689d54aa9b1e"

COPY ./_bootstrap.sh /_bootstrap.sh

# Install vips deps
RUN apk add --no-cache glib-dev libxml2-dev libexif-dev libpng-dev \
  giflib-dev tiff-dev && \
  apk add --no-cache --virtual .build-deps g++ make python outils-sha1 && \
# Download tarball, match sha1, decompress and delete
  wget http://www.vips.ecs.soton.ac.uk/supported/current/${VIPS}.tar.gz && \
  sha1 ${VIPS}.tar.gz | grep ${VIPS_SHA1} && \
  tar -xzf ${VIPS}.tar.gz && \
# Go into vips directory, build, install, then delete
  cd ${VIPS} && \
  ./configure && make && make install && \
  cd .. && rm -rf ${VIPS} ${VIPS}.tar.gz && \
# Remove depenencies
  apk del .build-deps && \
# Install nodejs and awscli
  apk add --no-cache nodejs groff less python py-pip && \
  pip --no-cache-dir install awscli && \
# Make initial entrypoint executable
  chmod +x /_bootstrap.sh

ENTRYPOINT ["/_bootstrap.sh"]
