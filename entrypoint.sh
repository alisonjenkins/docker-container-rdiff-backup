#!/bin/sh
while true; do
    sleep "$BACKUP_INTERVAL"
    rconc 127.0.0.1:25575 "Backing up server"
    rconc 127.0.0.1:25575 save-all
    sleep 2
    rdiff-backup backup "$WORLD_PATH" "$BACKUP_PATH"
    rconc 127.0.0.1:25575 "Backup completed"
done
