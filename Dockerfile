FROM nixos/nix:2.25.2
ARG TARGETARCH
RUN echo filter-syscalls = false >> /etc/nix/nix.conf
RUN nix-channel --update
RUN nix-env --install rdiff-backup
RUN nix-env --install rconc
RUN nix-env --install ps-procps
ADD entrypoint.sh /bin/entrypoint
RUN chmod +x /bin/entrypoint
ADD list-backups.sh /bin/list-backups
RUN chmod +x /bin/list-backups
ADD restore-backup.sh /bin/restore-backup
RUN chmod +x /bin/restore-backup
ADD bashrc /root/.bashrc
ENTRYPOINT [ "/bin/entrypoint" ]
