# Docker image for Prometheus node exporter on arm64 architecture

Small dockerfile for running node exporter on arm64 architecture.

* Run
```
docker run -d -p 9100:9100
	--name node_exporter
        -v /proc:/host/proc
	-v /sys:/host/sys
        mqll/node_exporter-arm
```
