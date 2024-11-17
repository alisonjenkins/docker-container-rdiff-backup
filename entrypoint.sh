#!/bin/sh
while true; do
    sleep 900
    rconc 127.0.0.1:25575 "Backing up server"
    rconc 127.0.0.1:25575 save-all
    sleep 2
    rdiff-backup backup /mnt/state /mnt/backups
    rconc 127.0.0.1:25575 "Backup completed"
done
