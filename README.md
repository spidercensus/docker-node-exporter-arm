# Docker image for Prometheus node exporter on arm64 architecture

Small dockerfile for running node exporter on arm64 architecture.

* Simple Run
```
docker run -d -p 9100:9100
           --name node_exporter
           -v /proc:/host/proc
           -v /sys:/host/sys
           -v /:/rootfs:ro
        spidercensus/node-exporter-arm
```

* With options
```
docker run -d -p 9100:9100
           --name node_exporter
           -e "EXTRA_OPTS=--no-collector.wifi"
           -v /proc:/host/proc
           -v /sys:/host/sys
           -v /:/rootfs:ro
        spidercensus/node-exporter-arm
```
