#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

export XMODIFIERS="@im=fcitx"
export QT_IM_MODULE=fcitx
export GTK_IM_MODULE=fcitx
export DefaultIMModule=fcitx

if command -v fcitx-autostart >/dev/null; then
  fcitx-autostart &
fi
if command -v libinput-gestures-setup >/dev/null; then
  libinput-gestures-setup start &
fi
if command -v redshift >/dev/null; then
  /usr/bin/redshift &
fi
if command -v greenclip >/dev/null; then
  /usr/bin/greenclip daemon &
fi
urxvtd -o -f
setxkbmap -option ctrl:nocaps
exec i3
