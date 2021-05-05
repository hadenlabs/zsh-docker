#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function drmi_all {
    docker images -q -f "dangling=true" | xargs docker image rm -f
}

function drmi_dang {
    docker images -q -f "dangling=true" | xargs docker image rm -f
}

function dpsl {
    docker ps -l "$@"
}

function dip {
    docker inspect --format "{{ .NetworkSettings.IPAddress }}" "$@"
}

function dstop_all {
    docker ps -q -f "status=running" | xargs docker stop
}

function drm_stopped {
    docker ps -q -f "status=exited" | xargs docker rm
}

function drmv_stopped {
    docker ps -q -f "status=exited" | xargs docker rm -v
}

function drm_all {
    docker ps -a -q | xargs docker rm
}

function drmv_all {
    docker ps -a -q | xargs docker rm -v
}

# volume

function dvls {
    docker volume ls "$@"
}

function dvrm_all {
    docker volume ls -q | xargs docker volume rm
}

function dvrm_dang {
    docker volume ls -q -f "dangling=true" | xargs docker volume rm
}

# clean up
function docker-clean-containers {
    local list_containers
    list_containers="$(docker container ls -a -q)"
    docker container ls -a -q && docker container stop "${list_containers}"
    docker container ls -a -q && docker container rm "${list_containers}"
}

function docker-clean-images {
    docker image ls -a -q | xargs docker image rm -f
}

function docker-clean-volumes {
    docker volume ls -q | xargs docker volume rm -f
}

function docker-clean-networks {
    docker network ls -q | xargs docker network rm -f
}

function docker-clean-unused {
    docker system prune --all --force --volumes
}

function docker-clean-images-dang {
    docker images -q -f "dangling=true" | xargs docker rmi -f
}

function docker-clean-all {
    local list_containers
    list_containers="$(docker container ls -a -q)"
    docker container ls -a -q \
        && docker container stop "${list_containers}" \
        && docker system prune -a -f --volumes
}

function docker-containers-stop-all {
    docker ps -q -f "status=running" | xargs docker stop
}

function docker-volumes-rm-dang {
    docker volume ls -q -f "dangling=true" | xargs docker volume rm -f
}
