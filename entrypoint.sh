#!/bin/bash

if [ -z "$EXCLUDE" ]; then
    excludedirs=""
else
    excludedirs="--exclude-dirs=$EXCLUDE"
fi

if [ -z "$READONLY" ]; then
    readonly=""
else
    readonly="--read-only"
fi

case "$1" in
token)
    yandex-disk token --auth=$TOKEN
    ;;
start)
    yandex-disk start --no-daemon --dir=/y --auth=$TOKEN ${excludedirs} #${OPTIONS}
    ;;
*)
    "$@"
    ;;
esac