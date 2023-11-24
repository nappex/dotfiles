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
