cd "$(dirname "$0")"

cta=0
cta2=0

for ((i = 1 ; i <= 1000 ; i++)); do

    rmaxlimit=$(sed -n "$i"p input.txt | sed 's/\([^:]*\)\(.*\)/\1/' | sed 's/\([^-]*\)\(.*\)/\2/' | cut --complement -d "-" -f 1 | cut -d " " -f 1)
    rminlimit=$(sed -n "$i"p input.txt | sed 's/\([^:]*\)\(.*\)/\1/' | sed 's/\([^-]*\)\(.*\)/\1/')
    letter=$(sed -n "$i"p input.txt | sed 's/\([^:]*\)\(.*\)/\1/' | sed 's/\([^-]*\)\(.*\)/\2/' | cut --complement -d " " -f 1)
    pass=$(sed -n "$i"p input.txt | sed 's/\([^:]*\)\(.*\)/\2/' | cut --complement -d " " -f 1)
    #echo $rminlimit-$rmaxlimit $letter":" $pass

    count=$(echo $pass | grep -o $letter | wc -l)

    if [ $rminlimit -le $count ] && [ $rmaxlimit -ge $count ]; then
        cta=$(( $cta + 1 ))
        echo "found it" $cta
    fi

    #Part 2

    first=$(echo $pass | cut -c "$rminlimit")
    second=$(echo $pass | cut -c "$rmaxlimit")

    if [ "$first" == "$letter" ] && [ "$second" != "$letter" ]; then
        cta2=$(( $cta2 + 1 ))
        echo "found it" $cta2
    elif [ "$second" == "$letter" ] && [ "$first" != "$letter" ]; then
        cta2=$(( $cta2 + 1 ))
        echo "found it" $cta2
    fi
done

echo "Part 1:" $cta
echo "Part 2:" $cta2