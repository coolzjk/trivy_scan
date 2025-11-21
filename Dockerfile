FROM alpine:3.17.7

RUN apk update && apk add --no-cache \
    curl=7.88.1-r1 \
    openssl=1.1.1t-r0 \
    apk-tools=2.12.9-r3

RUN adduser -D -u 1000 appuser
USER appuser

CMD ["echo", "Hello World"]