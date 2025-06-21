#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function docker::config::main::factory {
    # shellcheck source=/dev/null
    source "${ZSH_DOCKER_PATH}"/config/base.zsh
    case "${OSTYPE}" in
    darwin*)
        # shellcheck source=/dev/null
        source "${ZSH_DOCKER_PATH}"/config/osx.zsh
        ;;
    linux*)
        # shellcheck source=/dev/null
        source "${ZSH_DOCKER_PATH}"/config/linux.zsh
      ;;
    esac

    case "${ZSH_DOCKER_CONTAINER_APP_NAME}" in
    podman*)
        # shellcheck source=/dev/null
        source "${ZSH_DOCKER_PATH}"/config/podman.zsh
        ;;
      docker*)
        # shellcheck source=/dev/null
        source "${ZSH_DOCKER_PATH}"/config/docker.zsh
      ;;
    esac
}

docker::config::main::factory
container::core