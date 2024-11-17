#!/bin/sh
rconc 127.0.0.1:25575 "say Starting manual backup of the server"
rconc 127.0.0.1:25575 "save-all flush"
sleep 2
rdiff-backup --api-version 201 backup "$WORLD_PATH" "$BACKUP_PATH"
rconc 127.0.0.1:25575 "say Backup completed"
