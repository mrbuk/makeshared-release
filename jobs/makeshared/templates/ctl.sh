#!/bin/sh

set -eu

RUN_DIR=/var/vcap/sys/run/makeshared
LOG_DIR=/var/vcap/sys/log/makeshared
PIDFILE=${RUN_DIR}/pid

case $1 in

  start)
    mkdir -p $RUN_DIR $LOG_DIR
    chown -R vcap:vcap $RUN_DIR $LOG_DIR

    echo $$ > $PIDFILE
    exec /var/vcap/jobs/makeshared/bin/run \
      >>  $LOG_DIR/makeshared.stdout.log \
      2>> $LOG_DIR/makeshared.stderr.log

    ;;

  stop)
    kill -9 `cat $PIDFILE`
    rm -f $PIDFILE

    ;;

  *)
    echo "Usage: ctl {start|stop}" ;;

esac
