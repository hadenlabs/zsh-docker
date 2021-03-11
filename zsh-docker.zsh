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
# shellcheck disable=SC2034  # Unused variables left for readability
ZSH_DOCKER_PATH=$(dirname "${0}")

# shellcheck source=/dev/null
source "${ZSH_DOCKER_PATH}"/config/main.zsh

# shellcheck source=/dev/null
source "${ZSH_DOCKER_PATH}"/internal/main.zsh

# shellcheck source=/dev/null
source "${ZSH_DOCKER_PATH}"/pkg/main.zsh
