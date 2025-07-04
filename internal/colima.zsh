#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function container::internal::container::install {
  if core::exists colima; then
    return
  fi
  message_info "Installing ${ZSH_DOCKER_PACKAGE_NAME}"
  core::install colima

  if ! core::exists docker; then
    core::install docker
  fi

  message_success "Installed ${ZSH_DOCKER_PACKAGE_NAME}"
}

function check_command {
  if ! command -v "$1" >/dev/null 2>&1; then
    echo "❌ '$1' is required but not installed. Please install it with: brew install $1"
    return 1
  fi
  return 0
}

function container::internal::container::load {
  check_command jq || return 1
  check_command colima || return 1

  local colima_status
  if ! colima_status=$(colima status --json 2>/dev/null | jq -r '.status'); then
    echo "⚠️ Could not get Colima status. Starting Colima..."
    colima start
    return
  fi

  if [[ "$colima_status" != "Running" ]]; then
    echo "🚀 Colima is not running. Starting Colima..."
    colima start
  fi
}