#!/bin/sh

set -eu

LOG_DIR=/var/vcap/sys/log/makeshared

echo -n "$(date) - "
/var/vcap/jobs/makeshared/bin/makeshared \
  >>  $LOG_DIR/pre-start.stdout.log \
  2>> $LOG_DIR/pre-start.stderr.log
