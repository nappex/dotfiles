#!/bin/ksh


_blue="#50FA7B"
_green="#69FF94"
_orange="#F1FA8C"
_red="#FF5555"


# Nerd Fonts - empty spaces are nerd fonts glyph/icons
# Battery state
set -A _pwr "%{F$_green}󰂄"
set -A _bat "%{F$_green}󰂂" "%{F$_orange}󰁾" "%{F$_red}󱃍"
# Wireless
set -A _wan "%{F$_green}直" "%{F$_orange}直" "%{F$_red}直"


_wlan_nic=$(ifconfig wlan 2>/dev/null | grep -o -E "^[a-z]+0")
_wlan_active=$(ifconfig wlan 2>/dev/null | grep "status: active")

function volume {
    echo "Hello"
}


function wireless {
    if [ -n "$_wlan_nic" ] && [ -n "$_wlan_active" ]
    then
        ifconfig "$_wlan_nic" | \
        awk -v g=${_wan[0]} -v o=${_wan[1]} -v r=${_wan[2]} '/eee80211:/ {
        if (int($8) > -59)      { printf "%s%s", "%{T2}", g }
        else if(int($8) > -79)   { printf "%s%s", "%{T2}", o }
        else                    { printf "%s%s", "%{T2}", r }
        { printf "%%\{F-\}%%\{T-\} %s", $3 }
        }'
    else
        printf "%s" "%{T2}󰖪%{T-}"
    fi
}

function datetime {
    printf "$(date '+%a %d.%m. %R')"
}

function battery {
    # if battery is charging
    if [ $(apm -a) -eq 1 ]
    then
        printf "%s" "%{T2}${_pwr[0]}"
    else
        # if battery is not charging print 3 states (high, low,critical)
        printf "%s" "%{T2}${_bat[$(apm -b)]}"
    fi
    printf "%s" "%{F-}%{T-}$(apm -l)%"
}

case $1 in
    "volume") volume;;
    "wireless") wireless;;
    "datetime") datetime;;
    "battery") battery;;
    *)
        echo "You forgot to tell me what to do!"
        exit 1
    ;;
esac

exit 0
#EOF
