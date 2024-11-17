#!/bin/sh
set -e
rconc 127.0.0.1:25575 "say Restoring backup... stopping world saving..."
rconc 127.0.0.1:25575 "save-off"
rdiff-backup --restore-as-of "$1" --force /mnt/backups
rconc 127.0.0.1:25575 "say Backup restored..."
sleep 2
rconc 127.0.0.1:25575 "say Restarting server..."
rconc 127.0.0.1:25575 "stop"
