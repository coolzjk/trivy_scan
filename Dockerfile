FROM debian:oldstable

RUN apt-get update && apt-get install -y \
    openssl=1.1.0l \
    && rm -rf /var/lib/apt/lists/*

CMD ["echo", "This image contains vulnerable packages"]