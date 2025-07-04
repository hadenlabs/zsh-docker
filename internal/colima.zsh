#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function container::internal::container::install {
  if core::exists colima; then
    return
  fi
  message_info "Installing ${ZSH_DOCKER_PACKAGE_NAME}"
  core::install colima
  message_success "Installed ${ZSH_DOCKER_PACKAGE_NAME}"
}

function container::internal::container::load {
  # Check if jq is installed
  if ! command -v jq >/dev/null 2>&1; then
    echo "❌ 'jq' is required but not installed. Please install it with: brew install jq"
    return 1
  fi

  # Check if colima is installed
  if ! command -v colima >/dev/null 2>&1; then
    echo "❌ 'colima' is required but not installed. Please install it with: brew install colima"
    return 1
  fi

  # Get current Colima machine status
  local status
  status=$(colima status --json | jq -r '.status')

  if [[ "$status" != "Running" ]]; then
    echo "🚀 Colima is not running. Starting Colima..."
    colima start
  fi
}
