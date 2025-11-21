FROM alpine:latest

RUN apk update && apk upgrade --no-cache && rm -rf /var/cache/apk/*

RUN adduser -D -u 1000 appuser
USER appuser

CMD ["echo", "Hello World"]
