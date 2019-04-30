FROM node:12
MAINTAINER ulf.seltmann@metaccount.de
VOLUME ["/app"]
ENTRYPOINT ["/docker/entrypoint"]
CMD ["run"]

# adding essentials
RUN apt-get update \
 && apt-get -y dist-upgrade \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y wget less vim locales graphicsmagick

ENV APP_HOME=/app \
	APP_USER=node \
    APP_DATA_DIR=/media \
    APP_TMP_DIR=/tmp

ADD assets /docker
RUN chmod 755 /docker/init /docker/entrypoint
RUN /docker/init \
 && rm -rf /docker/build
