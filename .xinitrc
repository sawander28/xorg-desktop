# .xinitrc

export QT_QPA_PLATFORM=xcb

setxkbmap de -variant pc-105

setxkbmap \
  -model ${XKBMODEL:-"pc105"} \
  -layout ${XKBLAYOUT:-"de"} \
  -variant ${XKBVARIANT:-"nodeadkeys"} \
  -option terminatr:ctrl_alt_bksp

xsetroot -cursor_name plan9

xset +fp /usr/share/fonts/cantarell
xset +fp ~/.local/share/fonts/Terminus

# mouse fast
xset m 4 2

# no screensaver
xset s off
xset -dpms

fbsetbg -A ~/.local/share/backgrounds/fluxbox

[ -r ~/.Xresources ] && xrdb -merge ~/.Xresources

for f in ~/.xinitrc.d/* ; do
  "$f"
done



exec xterm -geometry 80x66+0+0 -name login

#exec fluxbox
