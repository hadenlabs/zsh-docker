#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function container::internal::container::install {
  if core::exists lima; then
    return
  fi
  message_info "Installing ${ZSH_DOCKER_PACKAGE_NAME}"
  core::install lima
  message_success "Installed ${ZSH_DOCKER_PACKAGE_NAME}"
}

function container::internal::container::load {
  local machine_name="${ZSH_DOCKER_LIMA_MACHINE_NAME:-default}"

  # Check if jq is installed
  if ! command -v jq >/dev/null 2>&1; then
    echo "❌ 'jq' is required but not installed. Please install it with: brew install jq"
    return 1
  fi

  # Check if the Lima machine exists
  if ! limactl list --json | jq -e --arg name "$machine_name" '.[] | select(.name == $name)' >/dev/null; then
    echo "🔧 Lima machine '${machine_name}' does not exist. Initializing..."
    limactl start "$machine_name"
    return
  fi

  # Check if the machine is running
  local running
  running=$(limactl list --json | jq -r --arg name "$machine_name" '.[] | select(.name == $name) | .state')

  if [[ "$running" != "Running" ]]; then
    echo "🚀 Lima machine '${machine_name}' exists but is not running. Starting..."
    limactl start "$machine_name"
  else
    echo "✅ Lima machine '${machine_name}' is already running."
  fi
}