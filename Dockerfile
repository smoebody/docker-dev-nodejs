### install node ###
FROM node:latest
MAINTAINER u.seltmann@gmail.com
VOLUME ["/app"]
ENTRYPOINT ["/docker/init"]
CMD ["run"]
ENV APP_HOME /app
COPY assets/build /docker/build
RUN chmod 755 /docker/build/init \
 && /docker/build/init

COPY assets/setup /docker/setup
COPY assets/init /docker/init
RUN chmod 755 /docker/init
USER dev
