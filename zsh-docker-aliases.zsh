#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

# Images

alias di='docker images'

alias drmi='docker rmi'

alias dbu='docker build'

alias drmi_all='docker rmi $* $(docker images -a -q)'

alias drmi_dang='docker rmi $* $(docker images -q -f "dangling=true")'


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
