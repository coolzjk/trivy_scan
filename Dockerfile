FROM alpine:3.17.7

RUN apk update && apk add --no-cache libexpat=2.5.0-r0

RUN adduser -D -u 1000 appuser
USER appuser

CMD ["echo", "Hello World"]