#!/bin/bash
source controlPrime.sh



echo "Lutfen bir sayi giriniz(Max: 4.100.200.300):"
read number


divisibilityRulesControl
returnController=$?
if [ $returnController -eq 0 ];then
    generalPrimeControl
    returnPrimeController=$?
    if [ $returnPrimeController -eq 0 ];then
        echo "Prime"
    else
        echo "Prime değil"
    fi
else
    #zaten bölünmüş prime değil yazıcak ekrana
    echo "Prime değil"
fi

