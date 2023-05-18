cd "$(dirname "$0")"

slope() {
    aux=$(( 32  -$xm)); x=1; y=1; slope=""; cta=0

    for (( i = 1 ; y < 323 ; i++ )); do
        if [ $x -ge $aux ]; then 
            #echo "X:" $x
            x=$(( $x - 31 ))
            #echo "X:" $x
        fi
        x=$(( $x + $1 ))
        y=$(( $y + $2 ))
        slope=$(sed -n "$y"p input.txt | cut -c "$x")
        #echo $slope "y:" $y "x:" $x
        if [ $slope == "#" ]; then
            #echo "Tree"
            cta=$(( $cta + 1 ))
        fi
    done
    echo $cta
    multy=$(( $multy * $cta ))

}
multy=1
xm=1; ym=1
slope $xm $ym
xm=3; ym=1
slope $xm $ym
xm=5; ym=1
slope $xm $ym
xm=7; ym=1
slope $xm $ym
xm=1; ym=2
slope $xm $ym
echo $multy 
