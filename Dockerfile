FROM alpine:latest
RUN apk update
RUN apk add rdiff-backup busybox
