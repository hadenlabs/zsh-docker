#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function docker::internal::main::factory {
    # shellcheck source=/dev/null
    source "${ZSH_DOCKER_PATH}"/internal/base.zsh
    case "${OSTYPE}" in
    darwin*)
        # shellcheck source=/dev/null
        source "${ZSH_DOCKER_PATH}"/internal/osx.zsh
        ;;
    linux*)
        # shellcheck source=/dev/null
        source "${ZSH_DOCKER_PATH}"/internal/linux.zsh
      ;;
    esac
}

docker::internal::main::factory
