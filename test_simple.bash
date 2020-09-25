#!/usr/bin/env bash
rm -f test.log;
dpkg --get-selections | grep ^libc | cut -d':' -f1 | awk '{ print $1}' | tee -a test.log