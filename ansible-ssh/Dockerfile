FROM alpine:3.16.2

LABEL org.opencontainers.image.author="Patrick Stöckle <patrick.stoeckle@posteo.de>"

RUN apk add --no-cache ansible=5.8.0-r0 openssh=9.0_p1-r2 \
    && rm -rf /var/cache/apk/* \
    && addgroup -S ci-group \
    && adduser -S ci-user -G ci-group

WORKDIR /home/ci-user
USER ci-user
