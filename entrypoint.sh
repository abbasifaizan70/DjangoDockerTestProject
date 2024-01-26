#!/bin/bash

# Wait for the Postgres server to start up
# (Optional, might be needed if your Django container starts before Postgres is ready)
# while ! nc -z $DB_HOST $DB_PORT; do   
#   sleep 0.1
# done

# Apply database migrations
echo "Applying database migrations..."
python3 manage.py makemigrations
python3 manage.py migrate

# Start server
echo "Starting server..."
python3 manage.py runserver 0.0.0.0:8000
