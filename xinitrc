# Run xrdb to get customizations from Xresources
xrdb -merge ~/.Xresources

#
# This line is necessary so that Java apps behave
# with XMonad.
#
export _JAVA_AWT_WM_NONREPARENTING=1

# 
# This line keeps the theme appearance consistent across
# GTK and qt apps.
export GTK2_RC_FILES="/home/chris/.gtkrc-2.0"

############################################################
#
# Applets in trayer
#
############################################################
# wicd trayer 
wicd-client --tray &

#gnome-power-manager &
dropboxd &

# Reset pointer so that it isn't the X.
xsetroot -cursor_name left_ptr

# .xmoadmaprc contains changes to keyboard setup; remapping CAPS LOCK as another Control key for emacs
xmodmap ~/.xmodmaprc

# Trayer, a system tray for network-manager and other stuff
trayer --edge top --align right --SetPartialStrut true --width 5 --height 18 --transparent true --alpha 0 --tint 0x000000 &

# Use feh to set background image.
#feh --bg-max ~/wallpaper/las_meninas.jpg
#feh --bg-fill ~/wallpaper/redwood.jpg

# Set the background with my script which grabs the latest wikipedia POTD
~/wallpaper_grabber.sh

# Use xcompmgr for some transparency
#xcompmgr &
#xcompmgr -f -c -n -F -D 1 &
# this version from this discussion: https://bbs.archlinux.org/viewtopic.php?id=55592
#xcompmgr -cCf -r 0 -D 2 &
# Use xmonad; necessy to use consolekit, hence ck-launch-session
exec dbus-launch ck-launch-session xmonad
