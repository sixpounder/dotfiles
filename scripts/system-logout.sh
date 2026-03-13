#!/bin/bash

nohup bash -c "sleep 2 && uwsm stop" >/dev/null 2>&1 &

hyprctl clients -j | \
  jq -r ".[].address" | \
  xargs -I{} hyprctl dispatch closewindow address:{}

hyprctl dispatch workspace 1