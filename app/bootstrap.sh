#!/bin/bash

set -e
touch /usr/local/var/log/django/gunicorn_stdout.log
touch /usr/local/var/log/django/supervisord.log
tail -n 0 -f /usr/local/var/log/django/*.log &
/usr/bin/python /opt/app/manage.py migrate
/usr/bin/python /opt/app/manage.py compress
/usr/bin/python /opt/app/manage.py clearsessions
exec supervisord -c /opt/app/supervisord.conf
