#!/bin/bash

cat playlist.m3u | grep m3u8 | while read line; do
   status=$(curl -s -o /dev/null -w "%{http_code}" $line)
   if [ "$status" = 200 ]; then
     echo "$line => OK"
   else
     echo "$line => FAILED!"
   fi
done
