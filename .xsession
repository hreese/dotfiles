# Disable DPMS turning off the screen
xset -dpms
xset s off

# Disable bell
xset -b

# Enable zapping (C-A-<Bksp> kills X)
setxkbmap -option terminate:ctrl_alt_bksp

# Enforce correct locales from the beginning:
# LC_ALL is unset since it overwrites everything
# LANG=de_DE.UTF-8 is used, except for:
# LC_MESSAGES=C never translates program output
# LC_TIME=en_DK leads to yyyy-mm-dd hh:mm date/time output
unset LC_ALL
export LANG=de_DE.UTF-8
export LC_MESSAGES=C
export LC_TIME=en_DK.UTF-8

# Use XToolkit in java applications
export AWT_TOOLKIT=XToolkit

# Set background color
xsetroot -solid "#333333"

# Enable core dumps in case something goes wrong
ulimit -c unlimited

# start d-bus
eval $(dbus-launch --sh-syntax)

# gnome-settings
/usr/libexec/gnome-settings-daemon &

# start gnome-keyring-daemon
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,ssh,gpg | sed -e 's/^/export /g' -e 's/$/;/g')

#set xkbmap
#setxkbmap de

nm-applet &
gsettings-data-convert &
abrt-applet &
nautilus --no-default-window --no-desktop &
krb5-auth-dialog --auto &
dropbox start -i &
start-pulseaudio-x11 &
volumeicon &
parcellite &
dunst &

# Start i3 and log to ~/.i3/logfile
echo "Starting at $(date)" >> ~/.i3/logfile
#exec /usr/bin/i3 -V -d all >> ~/.i3/logfile

exec /usr/bin/i3 >> ~/.i3/logfile
