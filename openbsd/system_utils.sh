function list_available_fonts() {
  # parameter #1 is $1 - what name is looking for?
  # without parameter list all

  fc-list | cut -f2 -d: | sort -u | grep -i "$1"

}
