#!/bin/sh

set -e

if [ "$1" != "supervisord" ]; then
    supervisord --nodaemon > /dev/null 2>&1 &
fi;

exec "$@"
