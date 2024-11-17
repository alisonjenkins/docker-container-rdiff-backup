FROM nixos/nix:2.25.2
ARG TARGETARCH
RUN echo filter-syscalls = false >> /etc/nix/nix.conf
RUN nix-channel --update
RUN nix-env --install rdiff-backup
RUN nix-env --install rconc
ADD entrypoint.sh /usr/bin/entrypoint
RUN chmod +x /usr/bin/entrypoint
ADD list-backups.sh /usr/bin/list-backups
RUN chmod +x /usr/bin/list-backups
ADD restore-backup.sh /usr/bin/restore-backup
RUN chmod +x /usr/bin/restore-backup
ENTRYPOINT [ "/usr/bin/entrypoint" ]
