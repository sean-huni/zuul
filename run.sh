#!/usr/bin/env bash

# Script to deploy the app
deploy(){
# From the remote host-machine, run the following cmd
    docker pull s34n/zuul-img
    docker run --name='zuul' -d -it -p 8005:8005 s34n/zuul-img && docker logs zuul -f
}

# Tag-And-Push Script to tag & push the app
tagAndPush(){
    docker tag zuul-img:latest s34n/zuul-img:latest
    docker push s34n/zuul-img:latest
}

# Rebuild-Script to clean & build the app using the Dockerfile script
rebuild(){
    gradle clean
    gradle build
    docker build -f Dockerfile -t zuul-img .
    tagAndPush
}

# Let's get rid of the pre-existing docker images on the machine.
if [[ ! -z "$(docker container ps | grep zuul)" ]]; then
    echo "Zuul-Service Docker Container Found"
    docker stop zuul && docker rm zuul && docker rmi zuul-img
    rebuild
else
    echo "Zuul-Service Docker Container NOT Found"
    rebuild
fi

