# Short script to convert a binary into a hex .mem file for use with $memreadh
# Usage: ./bin2mem filename

FMT='2/2 "%04X" "\n"'
if [ -z "$1" ]; then
    cat | hexdump -ve "$FMT" | sed -E 's/(....)(....)$/\2\1/' 

else
    hexdump -ve "$FMT" "$1" | sed -E 's/(....)(....)$/\2\1/' 
fi


