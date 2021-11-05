#!/usr/bin/env bash

TARGETS="alacritty.yml conkyrc .vimrc lightdm.conf .zshrc .Xresources .xinitrc .profile picom.conf"
WIDTH=119
FONT="DOS Rebel"

for TARGET in $TARGETS; do
  TARGETFILE=configs/"$TARGET"
  COMMENTCHAR="#"
  DOTFILE=false
  if [[ ${TARGET::1} == "." ]]; then
    DOTFILE=true
  fi
  figlet -kc -w $WIDTH -f "$FONT" "${TARGET%.*}" > "$TARGETFILE"

  if ! $DOTFILE; then
    EXTENSION="${TARGET##*.}"
    if [ "$EXTENSION" == "$TARGET" ]; then
      COMMENTCHAR="#"
    fi
    if [ "$EXTENSION" == "yml" ]; then
      COMMENTCHAR="#"
    fi
  fi
  sed -i "s/^/${COMMENTCHAR}/" "$TARGETFILE"
done
