# dev-nodejs

## What is this image intended for?

## How to use this image

now you can use the docker to use this folder as vufind base and wrap the runtime environment around

    docker run --name dev-nodejs -d -v /path/to/my/project:/app -p 127.0.0.1:80:80 docker.io/smoebody/dev-nodejs

this starts the container named _dev-nodejs and sets up all the components with its default values. you should now be able
to reach the your project folder at

http://127.0.0.1/

## How to debug

## How to to profile

## how to test mail send

This utilises the docker-image [smoebody/mailcollect][1] which acts as smtp-server and catches all sent emails in one inbox,
regardless where its sent.

to use it in conjunction with this docker-image you should start a container first. after its up and running you have
to link this container to the dev-nodejs container by adding the _--link_ option to the run-command above

    docker run --name dev-nodejs -d -v /path/to/my/project:/app -p 127.0.0.1:80:80 --link=mailcollect:smtp docker.io/smoebody/dev-nodejs

The dev-nodejs container is now connected to the mailcollect container and all mail that is sent by it ends in the
mailcollects inbox. see [smoebody/mailcollect][5] for further details.

## run a interactive console in the container

    docker exec -ti dev-nodejs /bin/bash

## To do

  [1]: https://registry.hub.docker.com/u/smoebody/mailcollect/
