#!/usr/bin/env bash

TMPDUMP=flf_fonts.txt
TARGET_FILE=test_files/figlet_font_list.txt
WIDTH=120
TESTSTRING="Testconfig"

make_line() {
    COUNTER=1
    while [ $COUNTER -lt $WIDTH ]; do
      echo -ne "#" >> "$TARGET_FILE"
      (( COUNTER++ )) || true
    done
    echo "#" >> "$TARGET_FILE"
}

test_font () {
  make_line
  basename "$1" >> "$TARGET_FILE"
  figlet -w "$WIDTH" -c -f "$1" "$TESTSTRING" >> "$TARGET_FILE"
  make_line
}

rm $TARGET_FILE

find / -type f -name "*.flf" 1> $TMPDUMP 2>/dev/null

while IFS= read -r line; do
  test_font "$line"
done < $TMPDUMP

rm $TMPDUMP
