#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function docker::clean::all {
    docker::internal::clean::all
}

function docker::clean::image::all {
    docker::internal::images::delete::all
}

function docker::clean::image::dangling {
    docker::internal::images::delete::dangling
}

function docker::clean::process::all {
    docker::internal::process::delete::all
}

function docker::clean::process::dangling {
    docker::internal::process::delete::dangling
}

function docker::clean::volume::all {
    docker::internal::volume::delete::all
}

function docker::clean::volume::dangling {
    docker::internal::volume::delete::dangling
}

function docker::clean::network::all {
    docker::internal::network::delete::all
}

function docker::clean::network::dangling {
    docker::internal::network::delete::dangling
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

function docker::containers::delete::all {
    docker::internal::containers::delete::all
}

function docker::containers::stop::all {
    docker::internal::containers::stop::all
}

function docker::network::delete::all {
    docker::internal::network::delete::all
}