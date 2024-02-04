FROM alpine:3.19.1
MAINTAINER spidercensus
# Note -- It would be way better if this chose the architecture on the fly.

ARG EXPORTER_VERSION=1.7.0
ARG ARCH=arm64
ARG EXPORTER_URL=https://github.com/prometheus/node_exporter/releases/download/v${EXPORTER_VERSION}/node_exporter-${EXPORTER_VERSION}.linux-arm64.tar.gz

RUN echo ${EXPORTER_URL}

RUN apk add wget
RUN wget ${EXPORTER_URL} -O node_exporter.tgz
RUN tar -vxzf node_exporter.tgz

RUN "cp" "node_exporter-${EXPORTER_VERSION}.linux-${ARCH}/node_exporter" "/usr/local/bin/node_exporter"
COPY entrypoint.sh .


ENV HOST_PROC /host/proc
ENV HOST_SYS /host/sys
ENV HOST_ROOTFS /rootfs
ENV EXTRA_OPTS ""

EXPOSE 9100

ENTRYPOINT [ "./entrypoint.sh" ]
