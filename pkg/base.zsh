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

function docker::proccess::list {
    docker::internal::procces::list
}

function docker::proccess::stop::all {
    docker::internal::procces::stop::all
}

function docker::proccess::stop::exited {
    docker::internal::procces::stop::exited
}

function docker::clean::proccess::delete::all {
    docker::internal::proccess::delete::all
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

function docker::networks::delete::all {
    docker::internal::networks::delete::all
}