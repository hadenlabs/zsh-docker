#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function docker::clean::all {
    docker::internal::clean::all
}

function docker::clean::dangling {
    docker::clean::images::dangling
    docker::clean::volume::dangling
    docker::clean::network::dangling
}

function docker::clean::images::all {
    docker::images::delete::all
}

function docker::clean::images::dangling {
    docker::images::delete::dangling
}

function docker::clean::process::all {
    docker::process::delete::all
}

function docker::clean::process::dangling {
    docker::process::delete::dangling
}

function docker::clean::volume::all {
    docker::volume::delete::all
}

function docker::clean::volume::dangling {
    docker::volume::delete::dangling
}

function docker::clean::network::all {
    docker::network::delete::all
}

function docker::clean::network::dangling {
    docker::network::delete::dangling
}

function docker::process::list {
    docker::internal::procces::list
}

function docker::process::stop::all {
    docker::internal::procces::stop::all
}

function docker::process::stop::exited {
    docker::internal::procces::stop::exited
}

function docker::process::delete::all {
    docker::internal::process::delete::all
}

function docker::volume::delete::all {
    docker::internal::volume::delete::all
}

function docker::volume::list::all {
    docker::internal::volume::list::all
}

function docker::volume::delete::exited {
    docker::internal::volume::delete::exited
}

function docker::volume::delete::dangling {
    docker::internal::volume::delete::dangling
}

function docker::container::delete::all {
    docker::internal::container::delete::all
}

function docker::container::stop::all {
    docker::internal::container::stop::all
}

function docker::container::delete::dangling {
    docker::internal::container::delete::dangling
}

function docker::network::delete::all {
    docker::internal::network::delete::all
}

function docker::network::delete::dangling {
    docker::internal::network::delete::dangling
}

# images docker

function docker::images::delete::dangling {
    docker::internal::images::delete::dangling
}

function docker::images::delete::all {
    docker::internal::images::delete::all
}