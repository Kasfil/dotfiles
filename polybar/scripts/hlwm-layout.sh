#!/bin/env sh

while true; do
    herbstclient layout | grep FOCUS | sed -e "s|:.*||" -e "s|.*─╼ ||"
done
