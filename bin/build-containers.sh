#! /bin/sh

BASEDIR=$(dirname $(dirname $0))
DOCKER_TAG_PREFIX=${DOCKER_TAG_PREFIX:-sophaskins}
RELEASE="0.9"

for CONTAINER_NAME in $(/bin/ls "$BASEDIR"/dockerfiles); do
    DOCKER_TAG="$DOCKER_TAG_PREFIX/$CONTAINER_NAME:$RELEASE"
    docker build -t "$DOCKER_TAG" "$BASEDIR/dockerfiles/$CONTAINER_NAME"
done
