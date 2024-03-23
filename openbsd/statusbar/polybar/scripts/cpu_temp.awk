BEGIN { printf "%s", "%{T2}" }
{
      temp = $1
      if (temp < 50)          { printf "%s", g }
      else if(temp < 70)      { printf "%s", o }
      else                    { printf "%s", r }
}
END { printf "%%\{F-\}%%\{T-\} %2.0d°C", temp }
