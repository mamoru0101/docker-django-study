#!/bin/sh
echo "entrypoint.sh"
python3 manage.py collectstatic --noinput
exec "$@"