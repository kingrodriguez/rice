#!/usr/bin/env bash

CONFIGBASEDIR=$PWD/testhome #$HOME
           # Name        File            Comment
ALACRITTY=( "Alacritty" "$CONFIGBASEDIR/.config/alacritty/alacritty.yml" "#" )
CONKY=(     "Conky"     "$CONFIGBASEDIR/.conkyrc"       "#" )
LIGHTDM=(   "LightDM"   "$CONFIGBASEDIR/.lightdm.conf"  "#" )
NITROGEN=(  "NITROGEN"  "$CONFIGBASEDIR/.lightdm.conf"  "#" )
PICOM=(     "Picom"     "$CONFIGBASEDIR/.picom.conf"    "#" )
PROFILE=(   "Profile"   "$CONFIGBASEDIR/.profile"      "#" )
VIM=(       "Vim"       "$CONFIGBASEDIR/.vimrc"        "#" )
XORG=(      "Xorg"      "$CONFIGBASEDIR/.Xresources"   "!" )
ZSH=(       "Zsh"       "$CONFIGBASEDIR/.zshrc"        "#" )
TARGETS=( ALACRITTY CONKY LIGHTDM PICOM PROFILE VIM XORG ZSH)
WIDTH=119
FONT="DOS Rebel"

for name in "${TARGETS[@]}"; do
  declare -n TARGET=$name

  TARGETDIR=$(dirname "${TARGET[1]}")
  TARGETFILE="${TARGET[1]}"
  FILE=$(basename "${TARGET[1]}")
  mkdir -p "$TARGETDIR"
  figlet -kc -w $WIDTH -f "$FONT" "${TARGET[0]}" > "$TARGETFILE"
  sed -i "s/^/${TARGET[2]}/" "$TARGETFILE"
  echo >> "$TARGETFILE"
  cat ./configs/"$FILE" >> $TARGETFILE

done
