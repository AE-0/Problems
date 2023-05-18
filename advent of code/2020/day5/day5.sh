cd "$(dirname "$0")"

seat=127            #128 if [1,128];  #127 if [0,127]
higher=0; highr=0; lowr=130; highc=0; lowc=9; lower=900

for line in {1..774}; do
    super=128; infer=0; ctar="";
    echo '---------------'$line
    for c in {1..7}; do
        #cat input.txt | sed -n "$line"p | cut -c "$c"
        if [[ "$(cat input.txt | sed -n "$line"p | cut -c "$c")" == "B" ]]; then
            ctar=$(( $ctar + 1 ))
            power=$(echo '2^'$(( $ctar )) | bc)
            infer=$(( ( $super ) - ( $seat + 1 ) / $power ))
            #echo 'from ' $infer ' to ' $(( $super - 1 )) $power
        fi
        if [[ "$(cat input.txt | sed -n "$line"p | cut -c "$c")" == "F" ]]; then
            ctar=$(( $ctar + 1 ))
            power=$(echo '2^'$(( $ctar )) | bc)
            super=$(( ( $super ) - ( $seat + 1 ) / $power ))
            #echo 'from' $infer ' to ' $(( $super - 1 )) $power
        fi
    done
    if [[ $infer -eq $(( $super - 1 )) ]]; then
        row=$infer
        echo -e 'row:\t' $row
        if [ $row -gt $highr ]; then
            highr=$row
        fi
        if [ $row -le $lowr ]; then
            lowr=$row
        fi
    fi
    super=8; infer=0; ctac=""; eseat=7
    for crevc in {4..2}; do
        #cat input.txt | sed -n "$line"p | rev | cut -c "$crevc" | rev
        if [[ "$(cat input.txt | sed -n "$line"p | rev | cut -c "$crevc" | rev)" == "R" ]]; then
            ctac=$(( $ctac + 1 ))
            power=$(echo '2^'$(( $ctac )) | bc)
            infer=$(( ( $super ) - ( $eseat + 1 ) / $power ))
            #echo 'from ' $infer ' to ' $(( $super - 1 )) $power
        fi
        if [[ "$(cat input.txt | sed -n "$line"p | rev | cut -c "$crevc" | rev)" == "L" ]]; then
            ctac=$(( $ctac + 1 ))
            power=$(echo '2^'$(( $ctac )) | bc)
            super=$(( ( $super ) - ( $eseat + 1 ) / $power ))
            #echo 'from ' $infer ' to ' $(( $super - 1 )) $power
        fi
    done
    if [[ $infer -eq $(( $super - 1 )) ]]; then
        columm=$infer
        echo -e 'columm:\t' $columm
        ID=$(( $row * 8 + $columm ))
        echo -e 'seat ID:' $ID
        if [ $ID -ge 100 ]; then
            arr[$line]=$ID
        else
            arrsub[$line]=$ID
        fi
        if [ $ID -gt $higher ]; then
            higher=$ID
        fi
        if [ $ID -le $lower ]; then
            lower=$ID
        fi
    fi
done
echo -e '\nhighest seat ID:' $higher    #855
echo 'lowest seat ID:' $lower           #81
echo 'highest row:' $highr              #106
echo 'lowest row:' $lowr                #10

IFS=$'\n' sorted=($(sort <<<"${arr[*]}"))
IFS=$'\n' sortedsub=($(sort <<<"${arrsub[*]}"))
#echo ${sortedsub[*]}
echo ${sorted[*]}

for sort in {101..855}; do
    if [ ${sorted[(( $sort - 100 ))]} -ne $sort ]; then
        echo ${sorted[(( $sort - 100 ))]}
        break
    fi
done
#236 and #552(right one) are missing