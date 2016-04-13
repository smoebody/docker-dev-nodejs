### install node ###
FROM node:latest
MAINTAINER u.seltmann@gmail.com
VOLUME ["/app"]
ENTRYPOINT ["/docker/init"]
CMD ["run"]

# adding essentials
RUN apt-get update \
 && apt-get -y dist-upgrade \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y wget less vim locales


ENV APP_HOME /app
COPY assets/build /docker/build
RUN chmod 755 /docker/build/init \
 && /docker/build/init

COPY assets/setup /docker/setup
COPY assets/init /docker/init
RUN chmod 755 /docker/init
