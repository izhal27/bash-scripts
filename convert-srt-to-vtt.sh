#!/bin/bash

files=(*.srt)
total=${#files[@]}
i=1

for f in "${files[@]}"; do
  echo "- Processing file: $f"
  eval ffmpeg -i "$f" "$i.vtt"
  i=$(( i + 1 ))
done