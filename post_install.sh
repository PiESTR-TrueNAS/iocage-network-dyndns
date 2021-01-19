#!/bin/sh

# This script gets executed inside the jail right after plugin installation
# This is executed BEFORE any jailman scripts

# ===== Variable
CRON_FILE="/tmp/cronfile"
DIRECTORY="/mnt/ddclient"


# ===== Prepare
mkdir -p "${DIRECTORY}"
touch "${CRON_FILE}"


# ===== Initialize jail
echo "@reboot /mnt/script/watch.sh" >> "${CRON_FILE}"
crontab -u root "${CRON_FILE}"

sysrc ddclient_enable="NO"
sysrc ddclientc_enable="YES"
