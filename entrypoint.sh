#!/bin/bash
set -e

# Remove the server PID file if it exists (important for Rails restart)
rm -f /docker_app/tmp/pids/server.pid

# Run the main container command (defined in CMD)
exec "$@"
