#!/bin/bash

# Exit on first error
set -e

echo "Running the script..."

# Run required migrations
export FLASK_APP=core/server.py

# Uncomment these lines if you need to run migrations
# flask db init -d core/migrations/
# flask db migrate -m "Initial migration." -d core/migrations/
# flask db upgrade -d core/migrations/

# Run server
gunicorn -c gunicorn_config.py core.server:app
