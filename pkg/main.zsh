#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function docker::pkg::main::factory {
    # shellcheck source=/dev/null
    source "${ZSH_DOCKER_PATH}"/pkg/base.zsh
    case "${OSTYPE}" in
    darwin*)
        # shellcheck source=/dev/null
        source "${ZSH_DOCKER_PATH}"/pkg/osx.zsh
        ;;
    linux*)
        # shellcheck source=/dev/null
        source "${ZSH_DOCKER_PATH}"/pkg/linux.zsh
      ;;
    esac

    # shellcheck source=/dev/null
    source "${ZSH_DOCKER_PATH}"/pkg/alias.zsh

}

docker::pkg::main::factory
