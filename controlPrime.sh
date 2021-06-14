source divisibilityRules.sh

declare -i controller
controller=0

#Bölünme kurallarının kontrol edilmesi
divisibilityRulesControl(){
    divideTwo
    returnValue=$?
    ((controller=controller || returnValue))
    divideThree
    returnValue=$?
    ((controller=controller || returnValue))
    divideFive
    returnValue=$?
    ((controller=controller || returnValue))
    divideSeven
    returnValue=$?
    ((controller=controller || returnValue))
    divideEleven
    returnValue=$?
    ((controller=controller || returnValue))
    divideThirteen
    returnValue=$?
    ((controller=controller || returnValue))
    divideSeventeen
    returnValue=$?
    ((controller=controller || returnValue))
    divideNineteen
    returnValue=$?
    ((controller=controller || returnValue))
    divideTwentyThree
    returnValue=$?
    ((controller=controller || returnValue))

    return $controller
    #0 sa bölünme olmamış
    #1 se en az birine bölünmüş
}


generalPrimeControl(){
    ((isPrime=0))
    for (( i = 2; i < $number ; ++i )); do
        ((modResult=number%i))
        if [ $modResult -eq 0 ];then
            ((isPrime=1))
            break;
        fi
    done
    echo $isPrime
    if [ $isPrime -eq 0 ];then
        return 0
    else
        return 1
    fi
}