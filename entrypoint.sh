#!/bin/sh

if ! test -d $HOST_PROC
then
  echo "missing /proc partition from the host"
  exit 1
fi

if ! test -d $HOST_SYS
then
  echo "missing /sys partition from the host"
  exit 1
fi

node_exporter --path.procfs $HOST_PROC --path.sysfs $HOST_SYS $EXTRA_OPTS
