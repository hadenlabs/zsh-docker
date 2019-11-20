#!/usr/bin/env ksh

function get_path {
    echo -n "${PATH}" |  \
        awk -v RS=: '!($0 in a) {a[$0]; printf("%s%s", length(a) > 1 ? ":" : "", $0)}'
}
