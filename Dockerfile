FROM alpine:latest
RUN apk update
RUN apk add rdiff-backup busybox
ADD entrypoint.sh /usr/bin/entrypoint
RUN chmod +x /usr/bin/entrypoint
ENTRYPOINT [ "/usr/bin/entrypoint" ]
