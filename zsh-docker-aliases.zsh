#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

#
# Defines alias for docker.
#
# Requirements:
#  - docker: https://www.docker.com
#  - zsh: https://www.zsh.org/
#
# Authors:
#   Luis Mayta <slovacus@gmail.com>
#

plugin_dir=$(dirname "${0}":A)
# shellcheck source=/dev/null
source "${plugin_dir}"/src/helpers/messages.zsh

if [ ! -x "$(command which docker)" ]; then
    message_error "Please install docker"
fi


alias d='docker'

# Images

alias di='docker images'

alias drmi='docker rmi'

alias dbu='docker build'

function drmi_all {
    docker rmi $* $(docker images -a -q)
}

function drmi_dang {
    docker rmi $* $(docker images -q -f "dangling=true")
}


# Containers

alias dps='docker ps'

alias dpsl='docker ps -l $*'

alias drm='docker rm'

alias dexec='docker exec'

alias dlog='docker logs'

alias dip='docker inspect --format "{{ .NetworkSettings.IPAddress }}" $*'

alias dstop_all='docker stop $* $(docker ps -q -f "status=running")'

alias drm_stopped='docker rm $* $(docker ps -q -f "status=exited")'

alias drmv_stopped='docker rm -v $* $(docker ps -q -f "status=exited")'

alias drm_all='docker rm $* $(docker ps -a -q)'

alias drmv_all='docker rm -v $* $(docker ps -a -q)'


# volume

alias dvls='docker volume ls $*'

alias dvrm_all='docker volume rm $(docker volume ls -q)'

alias dvrm_dang='docker volume rm $(docker volume ls -q -f "dangling=true")'

# clean up
function docker-clean-containers {
    local list_containers
    list_containers=$(docker container ls -a -q)
    docker container ls -a -q && docker container stop "${list_containers}"
    docker container ls -a -q && docker container rm "${list_containers}"
}

function docker-clean-images {
    local list_images
    list_images=$(docker image ls -a -q)
    docker image ls -a -q && docker image rm "${list_images}"
}

function docker-clean-volumes {
    local list_volumes
    list_volumes=$(docker volume ls -q)
    docker volume ls -q && docker volume rm "${list_volumes}"
}

function docker-clean-networks {
    local list_networks
    list_networks=$(docker network ls -q)
    docker network ls -q && docker network rm "${list_networks}"
}

function docker-clean-unused {
    docker system prune --all --force --volumes
}

function docker-clean-images-dang {
    docker rmi $* $(docker images -q -f "dangling=true")
}

function docker-clean-all {
    local list_containers
    list_containers=$(docker container ls -a -q)
    docker container ls -a -q \
        && docker container stop "${list_containers}" \
        && docker system prune -a -f --volumes
}

function docker-containers-stop-all {
    docker stop $* $(docker ps -q -f "status=running")
}

docker-volumes-rm-dang () {
    docker volume rm $(docker volume ls -q -f "dangling=true")
}
