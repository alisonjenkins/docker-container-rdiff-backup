FROM nixos/nix:2.25.2
ARG TARGETARCH
RUN echo filter-syscalls = false >> /etc/nix/nix.conf
RUN nix-channel --update
RUN nix-env --install rdiff-backup
RUN nix-env --install rconc
ADD entrypoint.sh /usr/bin/entrypoint
RUN chmod +x /usr/bin/entrypoint
ENTRYPOINT [ "/usr/bin/entrypoint" ]
