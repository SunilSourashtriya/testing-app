#!/bin/bash
set -e

rm -f /docker_app/tmp/pids/server.pid

exec "$@"
