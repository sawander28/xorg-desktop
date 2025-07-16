#!/bin/sh

[ -d /etc/X11/xinit/xinitrc.d ] && \
	for f in /etc/X11/xinit/xinitrc.d/*; do [ -x "$f" ] && . "$f"; done && unset f

#[ -r .local/share/backgrounds/default ] && \
#	feh --bg-fill --no-fehbg ~/.wallpaper/default || \
#	feh --recursive --randomize --bg-fill --no-fehbg ~/.wallpaper

#setxkbmap \
#    -layout 'us(altgr-intl),de(nodeadkeys)' \
#	-option 'grp:shifts_toggle,compose:menu,terminate:ctrl_alt_bksp'

#xmodmap ~/.config/xorg/us-intl-german.xmodmap

if [ "$(command -v uim-xim >/dev/null >&2)" ]; then
	export GTK_IM_MODULE="uim"
	export QT_IM_MODULE="uim"
	export XMODIFIERS="@im=uim"
fi

xrdb -merge ~/.config/xorg/Xresources
xset b off

xinput --set-prop 'Razer Razer Salmosa' 'libinput Accel Speed' -0.7 >/dev/null 2>&1

sct 4400 2>&- || : # color temperature

#exec dbus-launch --exit-with-session runsvdir -P ~/service
exec i3
