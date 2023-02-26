mkdir /etc/X11/xorg.conf.d/

doas cat >/etc/X11/xorg.conf.d/intel.conf<<"END"
Section "Device"
  Identifier "drm"
  Driver "intel"
  Option "TearFree" "true"
EndSection
END
