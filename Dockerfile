FROM debian:9
MAINTAINER MqllR <>

ARG EXPORTER_VERSION=0.17.0
ARG ARCH=arm64
ARG EXPORTER_URL=https://github.com/prometheus/node_exporter/releases/download/v${EXPORTER_VERSION}/node_exporter-${EXPORTER_VERSION}.linux-arm64.tar.gz

RUN apt update && \
    apt install -y wget && \
    wget ${EXPORTER_URL} && \
    tar xzf node_exporter-${EXPORTER_VERSION}.linux-${ARCH}.tar.gz node_exporter-${EXPORTER_VERSION}.linux-arm64/node_exporter && \
    cp node_exporter-$EXPORTER_VERSION.linux-arm64/node_exporter .

FROM busybox:1-glibc
MAINTAINER MqllR <>

ENV HOST_PROC /host/proc
ENV HOST_SYS /host/sys
ENV EXTRA_OPTS ""

COPY --from=0 /node_exporter /usr/local/bin/node_exporter
COPY . .

EXPOSE 9100

ENTRYPOINT [ "./entrypoint.sh" ]
