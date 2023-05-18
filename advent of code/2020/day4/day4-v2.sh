cd "$(dirname "$0")"

#greps='grep byr | grep iyr | grep eyr | grep hgt | grep hcl | grep ecl'

line=0
cta=0

#cat input_fixed.txt | grep byr | grep iyr | grep eyr | grep hgt | grep hcl | grep ecl | grep pid > input_valid.txt

for i in {1..237}; do
    vbyr=""
    viyr=""
    veyr=""
    #hgt=""
    vmedida=""
    #medida=""
    vhgt=""
    vpid=""
    vecl=""
    vhcl=""
    line=$(( $line + 1))
    echo '--------------Line: '$line

    for j in {1..9}; do
        #echo 'line:' "$i" 'f' "$j"                  #grep 'em all

        byr=$(cat input_valid.txt | sed -n "$i"p | cut -d " " -f "$j" | grep byr | grep -o '[0-9]*'| awk '$1>=1920 && $1<=2002')                 # BYR
        iyr=$(cat input_valid.txt | sed -n "$i"p | cut -d " " -f "$j" | grep iyr | grep -o '[0-9]*'| awk '$1>=2010 && $1<=2020')                 # IYR
        eyr=$(cat input_valid.txt | sed -n "$i"p | cut -d " " -f "$j" | grep eyr | grep -o '[0-9]*'| awk '$1>=2020 && $1<=2030')                 # EYR
        medida=$(cat input_valid.txt | sed -n "$i"p | cut -d " " -f "$j" | grep hgt | grep -o "cm\|in")                                          # HGT
        if [ "$medida" = "in" ]; then
            hgt=$(cat input_valid.txt | sed -n "$i"p | cut -d " " -f "$j" | grep -o '[1-9]*' | awk '$1>=59 && $1<=76')
            #hgt=$(echo $hgt | awk '$1<=76 && $1>=59')
        elif [ "$medida" = "cm" ]; then
            hgt=$(cat input_valid.txt | sed -n "$i"p | cut -d " " -f "$j" | grep -o '[1-9]*' | awk '$1>=150 && $1<=193')
            #hgt=$(echo $hgt | awk '$1<=193 && $1>=150')
        fi
        hcl=$(cat input_valid.txt | sed -n "$i"p | cut -d " " -f "$j" | grep -w 'hcl:#[0-9|a-f][0-9|a-f][0-9|a-f][0-9|a-f][0-9|a-f][0-9|a-f]')   # HCL
        ecl=$(cat input_valid.txt | sed -n "$i"p | cut -d " " -f "$j" | grep ecl | grep 'blu\|amb\|brn\|gry\|grn\|hzl\|oth')                     # ECL
        pid=$(cat input_valid.txt | sed -n "$i"p | cut -d " " -f "$j" | grep -w 'pid:[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')             # PID

        #echo -e 'Ecl\t' $ecl 'VEcl\t' $vecl
        #echo -e 'Pid\t' $pid 'VPid\t' $vpid

        if [[ -n $byr && $byr != $vbyr ]]; then
            vbyr=$byr
        fi
        if [[ -n $iyr && $iyr != $viyr ]]; then
            viyr=$iyr
        fi
        if [[ -n $eyr && $eyr != $veyr ]]; then
            veyr=$eyr
        fi
        if [[ -n $hgt && $hgt != $vhgt ]]; then
            vmedida=$medida
            vhgt=$hgt
        fi
        if [[ -n $hcl && $hcl != $vhcl ]]; then
            vhcl=$hcl
        fi
        if [[ -n $ecl && $ecl != $vecl ]]; then
            vecl=$ecl
        fi
        if [[ -n $pid && $pid != $vpid ]]; then
            vpid=$pid
        fi

        if [ -n "$vpid" -a -n "$vecl" -a -n "$vhcl" -a -n "$vhgt" -a -n "$veyr" -a -n "$viyr" -a -n "$vbyr" ]; then
            cta=$(( $cta + 1 ))
            echo $vbyr
            echo $viyr
            echo $veyr
            echo $vhgt $vmedida
            echo $vhcl
            echo $vecl
            echo $vpid
            echo "..........["$cta"].........."
            break
        fi
        
    done

done
echo -e "\n"$cta