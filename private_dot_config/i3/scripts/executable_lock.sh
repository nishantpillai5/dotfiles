img=/tmp/i3lock.png

scrot -o $img
# convert $img -blur 0x6 $img
# convert $img -scale 10% -scale 1000% -blur 0x2 $img

convert $img -blur 0x6 -font Liberation-Sans -pointsize 26 -fill white -gravity center -annotate +0+160 "Type Password to Unlock" ~/.config/i3/assets/lock.png -gravity center -composite $img

i3lock -u -i $img
