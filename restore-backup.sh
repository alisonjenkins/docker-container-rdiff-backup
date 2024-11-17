#!/bin/sh
set -e
rconc 127.0.0.1:25575 "say Restoring backup... stopping world saving..."
rconc 127.0.0.1:25575 "save-off"
rdiff-backup --api-version 201 --force restore --at "$1" "$BACKUP_PATH" "$WORLD_PATH"
rconc 127.0.0.1:25575 "say Backup restored..."
sleep 2
rconc 127.0.0.1:25575 "say Restarting server..."
rconc 127.0.0.1:25575 "stop"
