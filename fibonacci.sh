#!/bin/bash

source controlPrime.sh
source dotFunction.sh

while [ true ]
do
    echo "Lutfen bir sayi giriniz(Max: 4.100.200.300):"
    read userNumber
    eraseDot
    if [ $userNumber -lt 0 -o $userNumber -gt 4100200300 ];then
        echo "Girilen sayi gecersizdir."
    else
        break
    fi
done


sortedNumbers=()
((number=0))
((count=1))
((first=0))
((second=1))
sortedNumbers+=("F(0):1(Asal)")
while [ $number -le $userNumber ]
do  
    ((number=first+second))
    ((first=second))
    ((second=number))
    
    divisibilityRulesControl
    returnController=$?
    if [ $returnController -eq 0 ];then
        generalPrimeControl
        returnPrimeController=$?
        if [ $returnPrimeController -ne 0 ];then
            addDot
            sortedNumbers+=("F($count):$newnumber(Asal)")
            #echo "F($count):$number(Asal)"
        else
            addDot
            sortedNumbers+=("F($count):$newnumber")
            #echo "F($count):$number"
        fi
    else
        #zaten bölünmüş prime değil yazıcak ekrana
        addDot
        sortedNumbers+=("F($count):$newnumber")
        #echo "F($count):$number"
    fi
    
    ((count+=1))
done

for (( i = ${#sortedNumbers[@]}-1; i >= 0; i-- )); do
    echo ${sortedNumbers[i]}
done 





