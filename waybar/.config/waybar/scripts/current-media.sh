#!/bin/bash

while [[ true ]]; do
  artist="$(playerctl metadata artist)"
  title="$(playerctl metadata title)"
  album="$(playerctl metadata album)"

  tooltip="by: $artist \non: $album"
  text="${title}"

  echo "{\"tooltip\": \"$tooltip\", \"text\": \"$text\", \"class\": [\"playing\"]}"
  sleep 3
done

