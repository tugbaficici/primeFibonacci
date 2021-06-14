eraseDot(){
    ((userNumber=${userNumber//.}))
}

addDot(){
    if [ ${#number} -gt 3 ];then
        ((kalan=${#number}%3))
        ((dotcount=number/3))
        newnumber=""
        dot="."
        if [ $kalan -ne 0 ];then
                for (( i =0 ; i <$kalan; i++ )); do
                        newnumber="${newnumber}${number:$i:1}"
                        
                done 
                number2=${number:$kalan:(${#number}-$kalan)}
                newnumber="${newnumber}${dot}" 
        fi
        for (( i =1 ; i <${#number2}+1; i++ )); do
                ((moddot=i%3))
                if [ $moddot -eq 0 ];then
                        newnumber="${newnumber}${number2:$i-1:1}"
                        newnumber="${newnumber}${dot}"
                        
                else
                        newnumber="${newnumber}${number2:$i-1:1}"
                fi

        done
        newnumber=${newnumber:0:${#newnumber}-1}
    else
        newnumber=$number   
    fi
}