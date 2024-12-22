#!/bin/bash

while [[ true ]]; do
  window="$(hyprctl activewindow | grep 'title:' | awk -F ': ' '{print $2}')"
  echo "$window"
  sleep 0.5
done

