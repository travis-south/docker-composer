#!/bin/sh
cd /app
echo "currently in `pwd`"

USER_ID=${LOCAL_USER_ID:-9001}

echo "Starting with UID : $USER_ID"
adduser -s /bin/sh -u $USER_ID -D user
export HOME=/home/user

exec /usr/local/bin/gosu user composer $@
