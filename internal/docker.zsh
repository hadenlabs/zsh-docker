#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function container::internal::container::install {
  if core::exists docker; then
    return
  fi
  message_info "Installing ${ZSH_DOCKER_PACKAGE_NAME}"
  core::install docker
  message_success "Installed ${ZSH_DOCKER_PACKAGE_NAME}"
}

function container::internal::container::load {
  return
}