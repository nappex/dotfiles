# save username
username=$(whoami)

# switch to root
su
# connect to ethernet and download available HW drivers
echo "Connect your ethernet"
echo "Hit enter when your ethernet is connected: "
read 
ifconfig em0 up
ifconfig em0 inet autoconf
fw_update

usermod -G wheel,staff,_shutdown $username

# Set doas to run user commands as root
# the most used way, most tutorials use it
echo "permit persist keepenv :wheel" > /etc/doas.conf
# or alternatively
# echo "permit persist keepenv ${username} as root" > /etc/doas.conf


# vim /etc/hostname.iwm0
# join <your_nwid> wpakey <your_wpakey>
# inet autoconf
# sh /etc/netstart

# Set the trunk, network interface
# Set ethernet
echo up > /etc/hostname.em0

# set wireless network interface
cat > /etc/hostname.iwm0 << END
join <your_nwid> wpakey <your_wpakey>
up
END

# set trunk interface
cat > /etc/hostname.trunk0 << END
trunkproto failover trunkport em0
trunkport iwm0
inet autoconf
END

# apply all erratas from OpenBSD
syspatch

# switch back to user with exit
exit

doas pkg_add -l ../packages

# Europe/Prague does not work for me I have plus two hours
doas ln -sf /usr/share/zoneinfo/UTC /etc/localtime

echo "Run '\$man afterboot'"
echo "Hit Enter when you read it all"
read

# MOUSE SETTINGS
# ##############

# TAP TO CLICK
# enable for current session
doas wsconsctl mouse.tp.tapping=1
# If you want to keep tap to click persitent
echo "mouse.tp.tapping=1" | doas tee -a /etc/wsconsctl.conf

# NATURAL SCROLLING (REVERSE)
# enable for current session
doas wsconsctl mouse.reverse_scrolling=1
# keep the setting persistent
echo "mouse.reverse_scrolling=1" | doas tee -a /etc/wsconsctl.conf

# FAN SETTING
# ##########

# OpenBSD in version 7.1 had problem with fan noise
# solene% solve this by commands below
# https://dataswamp.org/~solene/2022-04-21-openbsd-71-fan-noise-temperature.html
# Must be installed obsdfreqd package from packages
rcctl ls on | grep ^apmd && rcctl set apmd flags -L && rcctl restart apmd
doas rcctl enable obsdfreqd
doas rcctl start obsdfreqd

# enable microphone for current session
#doas sysctl kern.audio.record=1

# ENABLE MICROPHONE
# enable microphone permanently
#echo "kern.audio.record=1" | doas tee /etc/sysctl.conf

# you can try out your microphone working with
# $ aucat -o test.wav
# to stop recording CTRL+C
#
# To listen you record
#  $ aucat -i test.wav


# ENABLE VIDEO, THE CAMERA
# enable video(camera) for current session
#doas sysctl kern.video.record=1

# enable video(camera) permanently
#echo "kern.video.record=1" | doas tee /etc/sysctl.conf

# allow user to use video
#doas chown $USER /dev/video0

# DEFAULT VOLUME LEVELS
# set default volume levels for micrphone and audio output
# audio output
echo "outputs.master=230,230" >>/etc/mixerctl.conf

#audio input (microphone)
echo "record.volume=230,230" >>/etc/mixerctl.conf

# you can also change settings dynamically by your needs with sndioctl
# example: sndioctl input.level+=0.5
# or sndioctl output.level=0.9
