#!/bin/bash

while [[ true ]]; do
  layout="$(localectl status | grep "Layout" | awk '{print $3}')"
  echo "$layout"
  sleep 1
done

