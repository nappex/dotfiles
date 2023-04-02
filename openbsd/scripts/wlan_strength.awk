BEGIN { printf "%s", "%{T2}" }
/eee80211:/ {
      # strength is in dBm range (-30[best] - -100[worst])
      # does not scale in linear but logarithmic
      strength = int($8)
      if (strength > -59)     { printf "%s", g }
      else if(strength > -79) { printf "%s", o }
      else                    { printf "%s", r }
      nwid = $3
}
END { printf "%%\{F-\}%%\{T-\} %.8s", nwid }
