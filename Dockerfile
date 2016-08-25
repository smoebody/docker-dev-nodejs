### install node ###
FROM node:latest
MAINTAINER ulf.seltmann@metaccount.de
VOLUME ["/app"]
ENTRYPOINT ["/docker/init"]
CMD ["run"]

# adding essentials
RUN apt-get update \
 && apt-get -y dist-upgrade \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y wget less vim locales graphicsmagick

ENV APP_HOME=/app \
	APP_USER=dev

ADD assets /docker
RUN chmod 755 /docker/build/init docker/init \
 && /docker/build/init \
 && rm /docker/build/devtools /docker/build/locale /docker/build/shell


