#! /bin/bash
sleep 10
bg=$(python2 -c 'import gio,sys; print(gio.File(sys.argv[1]).get_path())' $(gsettings get org.gnome.desktop.background picture-uri |tr -d \'))
feh --bg-fill "$bg" &
conky -c ~/.conkyrc
conky -c ~/.conky/spotyfyconky
