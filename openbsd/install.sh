# FUNCTIONS DEFINITION
Y_or_N() {
    printf "%s (y/N): " "$1"
    read -r answer
    if [ "$answer" != "${answer#[Yy]}" ]
    then
        return 0;
    else
        return 1;
    fi
}

# CONSTANTS
SCRIPT_DIR_PATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 || exit; pwd -P )"
CONFIG_HOME=$HOME/.config


doas mkdir /etc/X11/xorg.conf.d/

doas tee /etc/X11/xorg.conf.d/intel.conf << "END"
Section "Device"
  Identifier "drm"
  Driver "intel"
  Option "TearFree" "true"
EndSection
END

# install hw accelaration for intel
intel_CPU="$(sysctl hw.model | grep -i intel | cut -d "=" -f0"")"
if [ -n "$intel_CPU" ]
then
  echo Detected intel CPU $intel_CPU
  echo You should install vaapi driver with command below
  echo for intel generation 5th and higher install packages below
  echo \# pkg_add intel-media-driver libva-utils
  echo
  echo for intel generation 4th and lower install packages below
  echo \# doas pkg_add intel-vaapi-driver libva-utils

fi

# TODO it should check if exist and ask if you want
# to ovewrite it. That should be done for all below
cp -R ksh/ $HOME/.config/

cp .profile $HOME

# settings of X application especially of Xterm
cp .Xresources $HOME

#CWM
# by default cwm is finding ~/.cwmrc
# but I change to ~/.config/cwm/.cwmrc
mkdir $HOME/.config/cwm
cp .cwmrc "$_"

# TODO ENV variable is in xsession and also in profile
cp .xsession $HOME
