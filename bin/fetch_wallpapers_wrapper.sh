#!/bin/sh
/usr/local/bin/wallpaper-fetcher \
  -d ~/Pictures/wallpapers_downloaded \
  -r 1366x768 \
  -n 1 \
  --timeout 5 \
  "$@"
  
