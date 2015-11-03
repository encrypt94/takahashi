#!/bin/sh

putline(){
    string="$1"
    height=$(figlet "$string" | wc -l)
    length=$(figlet "$string" | wc -L)
    cols=$(tput cols)
    lines=$(tput lines)
    
    x=$(((lenght+cols)/3))
    y=$((height+lines/4))
    
    clear
    echo $n/${#arr[@]}
    yes '' | head -n $y
    printf "%-$(echo $x)s $(echo $string)" | figlet -w $cols | lolcat
}

IFS=$'\n' arr=($(<example))
n=0

frun=1

# hide cursor
tput civis

while :
do
    read -t 1 -n 1 key
    if [ $frun -eq 1 ]
    then
	putline "${arr[$n]}"
	frun=0
    fi
    case "$key" in
	'a')
	    n=$(($n-1))	
	    putline "${arr[$n]}"
	    ;;
	'd')
	    n=$(($n+1))
	    putline "${arr[$n]}"
	    ;;
	's')
	    n=$(dmenu < /dev/null)
	    putline "${arr[$n]}"
	    ;;
	'q')
	    break
	    ;;
    esac
done
clear
# show cursor
tput cnorm
