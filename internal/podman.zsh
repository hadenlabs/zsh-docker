#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function container::internal::container::install {
  if core::exists podman; then
    return
  fi
  message_info "Installing ${ZSH_DOCKER_PACKAGE_NAME}"
  core::install podman
  message_success "Installed ${ZSH_DOCKER_PACKAGE_NAME}"
}

function container::internal::container::load {
  local machine_name="${ZSH_DOCKER_PODMAN_MACHINE_NAME:-podman-machine-default}"

  # Check if jq is installed
  if ! command -v jq >/dev/null 2>&1; then
    echo "❌ 'jq' is required but not installed. Please install it with: brew install jq"
    return 1
  fi

  # Check if the Podman machine exists
  if ! podman machine list | grep -q "${machine_name}"; then
    echo "🔧 Podman machine '${machine_name}' not found. Initializing..."
    podman machine init --now --name "${machine_name}"
    return
  fi

  # Check if the machine is running
  local running
  running=$(podman machine list --format json | jq -r \
    --arg name "$machine_name" '.[] | select(.Name == $name) | .Running')

  if [[ "${running}" != "true" ]]; then
    echo "🚀 Podman machine '${machine_name}' exists but is not running. Starting..."
    podman machine start "${machine_name}"
  fi
}