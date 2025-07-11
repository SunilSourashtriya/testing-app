#!/bin/bash
set -e

# Remove old server PID file if exists (Rails doesn't like it)
rm -f /docker_app/tmp/pids/server.pid

# Run the Rails server with whatever CMD is passed
exec "$@"
