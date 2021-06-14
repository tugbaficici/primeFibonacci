source divisibilityRules.sh

declare -i controller
controller=0

#Bölünme kurallarının kontrol edilmesi
divisibilityRulesControl(){
    ((controller=0))
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
    if [ ${#number} -ne 1 ];then
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
    fi

    return $controller
    #0 sa bölünme olmamış
    #1 se en az birine bölünmüş
}


generalPrimeControl(){
    if [ $number -eq 2 ] || [ $number -eq 3 ]; then
        return 1 
    fi
    if [ $(($number % 2)) -eq 0 ] || [ $(($number % 3)) -eq 0 ]; then
        return 0 
    fi

    a=5 
    b=2

    while [ $((a * a)) -le $number ]; 
    do
        if [ $(($number % a)) -eq 0 ]; 
        then
            return 0 
        fi
        a=$((a + b))
        b=$((6 - b))
    done
    return 1
}

