FROM rust:1.42.0 as builder

ARG VERSION=1.4.1

WORKDIR /fddf/

RUN curl -L https://github.com/birkenfeld/fddf/archive/v$VERSION.tar.gz --output fddf.tar.gz \
    && tar -xvf fddf.tar.gz \
    && cd ./fddf-$VERSION/ \
    && cargo install --path /fddf/fddf-$VERSION/


FROM debian:10.3-slim

LABEL org.label-schema.vcs-url="https://github.com/mrsaints/docker-fddf" \
      maintainer="Ian L. <os@fyianlai.com>"

COPY --from=builder /usr/local/cargo/bin/fddf /usr/local/bin/fddf

WORKDIR /target/

CMD ["fddf"]
