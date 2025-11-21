FROM alpine:3.14.0

RUN apk update && apk add --no-cache \
    curl \
    openssl \
    libxml2

RUN adduser -D -u 1000 appuser
USER appuser

CMD ["echo", "Hello World"]