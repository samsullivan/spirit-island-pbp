#!/bin/sh

if [ ! -z "$DATABASE_SSLROOTCERT" ] && [ ! -z "$DATABASE_SSLROOTCERT_VALUE" ]; then
    echo "Creating sslrootcert file from environment variables..."
    mkdir -p ./static/
    echo $DATABASE_SSLROOTCERT_VALUE | sed 's/\\n/\'$'\n''/g' > $DATABASE_SSLROOTCERT
fi

if [ "$VERCEL_ENV" == "production" ]; then
    python3 manage.py migrate
fi