#!/bin/sh

[ -d /etc/X11/xinit/xinitrc.d ] && \
	for f in /etc/X11/xinit/xinitrc.d/*; do [ -x "$f" ] && . "$f"; done && unset f

[ -r ~/.left ] && [ -r ~/.right ] && \
    feh --no-fehbg --bg-center '~/.right' '~/.left' 

setxkbmap \
    -layout 'de(nodeadkeys)' \
	-option 'terminate:ctrl_alt_bksp'


xrdb -merge ~/.config/xorg/Xresources
xset b off

xinput --set-prop 'Razer Razer Salmosa' 'libinput Accel Speed' -0.7 >/dev/null 2>&1
xrandr --output DVI-I-1 --right-of HDMI-1

sct 4400 2>&- || : # color temperature

/usr/libexec/polkit-gnome-authentication-agent-1 &
gnome-keyring-daemon --start -C /run/user/1000/keyring

xautolock -time 6 -locker slock &
slstatus &

exec dwm
