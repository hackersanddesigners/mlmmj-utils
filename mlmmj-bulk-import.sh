INPUT=$1
LIST=$2

if [[ $# -lt 2 ]] ; then
    echo "✕ Not enough arguments supplied: please pass INPUT (path/to/file-with-list-of-addresses) and LIST (eg /var/spool/mlmmj/<list>)"
    exit 1
fi

while IFS= read -r ADDR; do
    sudo /usr/bin/mlmmj-sub -L $LIST -f -q -s -a $ADDR
    printf 'imported: %s\n' "$ADDR"
done < $INPUT
