FMT='2/2 "%04X" "\n"'
if [ -z "$1" ]; then cat | hexdump -ve "$FMT"; else hexdump -ve "$FMT" "$1"; fi

