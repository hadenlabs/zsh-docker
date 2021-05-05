#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function docker::internal::clean::all {
    docker system prune --all --force --volumes
}

# images docker

function docker::internal::images::delete::dangling {
    docker images -q -f "dangling=true" | xargs docker image rm -f
}

function docker::internal::images::delete::all {
    docker image ls -a -q | xargs docker image rm -f
}

# process docker

function docker::internal::procces::list {
    docker ps -l "$@"
}

function docker::internal::procces::stop::all {
    docker ps -q -f "status=running" | xargs docker stop
}

function docker::internal::procces::stop::exited {
    docker ps -q -f "status=exited" | xargs docker rm
}

function docker::internal::proccess::delete::all {
    docker ps -a -q | xargs docker rm
}

# volume docker

function docker::internal::volume::list::all {
    docker volume ls
}

function docker::internal::volume::delete::exited {
    docker ps -q -f "status=exited" | xargs docker rm -v
}

function docker::internal::volume::delete::all {
    docker volume ls -q | xargs docker volume rm -f
}

function docker::internal::volume::delete::dangling {
    docker volume ls -q -f "dangling=true" | xargs docker volume rm -f
}

# containers docker

function docker::internal::containers::delete::all {
    docker container ls -a -q | xargs docker container stop
    docker container ls -a -q | xargs docker container rm
}

function docker::internal::containers::stop::all {
    docker ps -q -f "status=running" | xargs docker stop
}

# networs docker

function docker::internal::networks::delete::all {
    docker network ls -q | xargs docker network rm -f
}