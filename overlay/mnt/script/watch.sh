#!/bin/sh

DIRECTORY="/mnt/ddclient"

if [ -d "${DIRECTORY}" ]; then
  inotifywait -m -q -e create,modify -m "${DIRECTORY}" |
  while read -r directory events filename; do
    if [ "${filename}" = "ddclient.conf" ]; then
      sysrc ddclientc_conf="${DIRECTORY}/ddclient.conf"
      sysrc ddclientc restart
    fi
  done
fi
