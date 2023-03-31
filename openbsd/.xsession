# To disable xconsole comment xconsole command
# in file /etc/X11/xenodm/Xsetup_0

# ENVIRONMENT VARIABLES
# use UTF-8 everywhere
export LANG=en_US.UTF-8

# specify location of kshrc
export ENV=$HOME/.config/ksh/.kshrc

# XRESOURCES
# load Xresources file
xrdb -merge $HOME/.Xresources

# xidle will lock your display after a period of inactivity
xidle &

# Set background color
xsetroot -solid '#4C566A' # or dimgray

# status bar
polybar top &

# WALLPAPERS
# set backgroud pictures as wallpaper
# with feh
feh --bg-scale -z /home/dastr/Pictures/wallpapers/

# or
#  install package openbsd-backgrounds
#  then uncomment below to use officila openBSD
#  and comment feh...
#
#if test -x /usr/local/bin/openbsd-wallpaper
#then
#	/usr/local/bin/openbsd-wallpaper
#fi

# start ssh-agent for whole session
# alternatively can be run ssh-agent cwm
# or generaly ssh-agent <your_window_manager>
eval $(ssh-agent)

# disable beep in terminal (system)
xset b off

xrandr --output default --dpi 96

# Start certain window manager (cwm, dwm, fvwm)
cwm

