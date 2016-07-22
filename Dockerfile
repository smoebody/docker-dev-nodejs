### install node ###
FROM node:latest
MAINTAINER ulf.seltmann@metaccount.de
VOLUME ["/app", "/home/dev/.npm"]
ENTRYPOINT ["/docker/init"]
CMD ["run"]
ENV APP_HOME=/app

# adding essentials
RUN apt-get update \
 && apt-get -y dist-upgrade \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y wget less vim locales graphicsmagick

ADD assets /docker
RUN chmod 755 /docker/build/init docker/init \
 && /docker/build/init
