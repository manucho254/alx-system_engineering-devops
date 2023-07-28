#!/usr/bin/env bash

FILE="/var/run/myscript.pid"

rm -f "$FILE"
echo "$PID" >> /var/run/myscript.pid
