#!/usr/bin/env bash
# make_zip.sh — create gpu_wall.zip on macOS / Linux
ZIPNAME="gpu_wall.zip"
FILES=(index.html sketch.js README.md make_zip.ps1 make_zip.sh)
for f in "${FILES[@]}"; do
  if [ ! -f "$f" ]; then
    echo "Warning: $f not found in $(pwd)"
  fi
done
rm -f "$ZIPNAME"
zip -r "$ZIPNAME" "${FILES[@]}"
echo "Created $ZIPNAME"
