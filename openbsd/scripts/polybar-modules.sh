#!/bin/ksh


SCRIPT_DIR_PATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 || exit; pwd -P )"

_blue="#3333FF"
_green="#69FF94"
_orange="#FFAB00"
_red="#FF5555"


# Nerd Fonts - empty spaces are nerd fonts glyph/icons
# Battery state
set -A _pwr "%{F$_green}󰂄"
set -A _bat "%{F$_green}󰂀" "%{F$_orange}󰁼" "%{F$_red}󱃍"
# Wireless     BEST - GOOD - BAD - NO CONNECTION
set -A _wlan "%{F$_green}直" "%{F$_orange}直" "%{F$_red}󱚵" "󰖪"
set -A _lan "%{F$_blue}󰈂󰈁󰈀"
set -A _cpu_t "%{F$_green}" "%{F$_orange}" "%{F$_red}"
set -A _spkr "󰕿" "󰖀" "󰕾" # 奄奔墳

# get name of driver
_wlan_nic=$(ifconfig wlan 2>/dev/null | grep -o -E "^[a-z]+0")
# get is status in ifconfig interface is active
_wlan_active=$(ifconfig wlan 2>/dev/null | grep "status: active")

# FUNCTIONS-------------------------------------

function microphone {
    level=$(sndioctl -n input.level | awk '{ print int($0*100) '})
    if [ $(sndioctl -n input.mute) -eq 0 ] || [ $level -eq 0 ]
    then
        printf "%s" "%{T2}%{T-}" # old icon -()
    else
        printf "%s %d%%" "%{T2}%{T-}" "$level" # old icon -()
    fi
}

function speaker {
    level=$(sndioctl -n output.level | awk '{ print int($0*100) '})
    if [ $(sndioctl -n output.mute) -eq 0 ] || [ $level -eq 0 ]
    then
        printf "%s" "%{T2}婢%{T-}"
    else
        icon=${_spkr[$((3*$level/101))]}
        printf "%s%d%%" "%{T2}$icon%{T-}" "$level"
    fi
}

function ethernet {
    printf "%s" "%{T2}$_lan[0]%{F-}%{T-}"
}

function backlight {
    printf "%s%.0f%%" "%{T2}%{T-}" "$(xbacklight -get)"
}

function kbdlayout {
    setxkbmap -query | \
    awk '/^layout:/ { printf "%s%s %s", "%{T2}", "%{T-}", toupper($2) }'
}

function cpu_temp {
    sysctl -n hw.sensors.cpu0.temp0 | \
    awk -v g=${_cpu_t[0]} -v o=${_cpu_t[1]} -v r=${_cpu_t[2]} \
    -f "$SCRIPT_DIR_PATH"/cpu_temp.awk
}

function wifi {
    if [ -n "$_wlan_nic" ] && [ -n "$_wlan_active" ]
    then
        ifconfig "$_wlan_nic" | \
        awk -v g=${_wlan[0]} -v o=${_wlan[1]} -v r=${_wlan[2]} \
        -f "$SCRIPT_DIR_PATH"/wlan_strength.awk
    else
        printf "%s" "%{T2}${_wlan[3]}%{T-}"
    fi
}

function datetime {
    printf "$(date '+%a %d.%m. %R')"
}

function battery {
    printf "%s" "%{T2}"
    if [ $(apm -a) -eq 1 ]
    # if battery is charging
    then
        printf "%s" "${_pwr[0]}"
    else
        # if battery is not charging print 3 states (high, low,critical)
        printf "%s" "${_bat[$(apm -b)]}"
    fi
    printf "%s" "%{F-}%{T-}$(apm -l)%"
}

case $1 in
    "microphone")   microphone;;
    "speaker")      speaker;;
    "backlight")    backlight;;
    "kbdlayout")    kbdlayout;;
    "cpu_temp")     cpu_temp;;
    "wifi")         wifi;;
    "ethernet")     ethernet;;
    "datetime")     datetime;;
    "battery")      battery;;
    *)
        echo "You forgot to tell me what to do!"
        exit 1
    ;;
esac

exit 0
#EOF
