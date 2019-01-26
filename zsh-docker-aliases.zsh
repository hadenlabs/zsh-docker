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

alias d='docker'

# Images

alias di='docker images'

alias drmi='docker rmi'

alias dbu='docker build'

drmi_all() {
    docker rmi $* $(docker images -a -q)
}

drmi_dang() {
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
docker-clean-containers() {
    docker container ls -a -q || docker container stop $(docker container ls -a -q)
    docker container ls -a -q || docker container rm $(docker container ls -a -q)
}

docker-clean-images() {
    docker image ls -a -q || docker image rm $(docker image ls -a -q)
}

docker-clean-volumes() {
    docker volume ls -q || docker volume rm $(docker volume ls -q)
}

docker-clean-networks(){
    docker network ls -q || docker network rm $(docker network ls -q)
}

docker-clean-unused() {
    docker system prune --all --force --volumes
}

docker-clean-all() {
    docker container ls -a -q || docker container stop $(docker container ls -a -q) && docker system prune -a -f --volumes
}
