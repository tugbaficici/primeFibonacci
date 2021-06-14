
#!/bin/bash

echo "Lutfen bir sayi giriniz(Max: 4.100.200.300):"
read number
 

eraseDot(){
    ((userNumber=${userNumber//.}))
    echo $userNumber
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
                number=${number:$kalan:(${#number}-$kalan)}
                newnumber="${newnumber}${dot}" 
        fi
        for (( i =1 ; i <${#number}+1; i++ )); do
                ((moddot=i%3))
                if [ $moddot -eq 0 ];then
                        newnumber="${newnumber}${number:$i-1:1}"
                        newnumber="${newnumber}${dot}"
                        
                else
                        newnumber="${newnumber}${number:$i-1:1}"
                fi

        done
        newnumber=${newnumber:0:${#newnumber}-1}
        return $newnumber
    fi
}


addDot