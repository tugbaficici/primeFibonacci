divideTwo(){
    ((resultTwo=$number % 2))
    if [ $resultTwo -eq 0 ];then
        return 1
    else
        return 0
    fi
}

divideThree(){
    ((resultThree=0))
    for (( i = 0; i < ${#number}; ++i )); do
        ((resultThree+=${number:$i:1}))
    done
    ((resultThree=resultThree%3))
    if [ $resultThree -eq 0 ];then
        return 1
    else
        return 0
    fi
}

divideFive(){
    #last digit ${number:(${#number}-1):1}
    if [ ${number:(${#number}-1):1} -eq 0 -o ${number:(${#number}-1):1} -eq 5 ];then
        return 1
    else
        return 0
    fi
}

divideSeven(){
    ((resultSeven=0))
    ((b=${number:(${#number}-1):1}))
    ((a=${number:0:-1}))
    ((resultSeven= a - (2*b)))
    ((resultSeven= resultSeven%7))

    if [ $resultSeven -eq 0 ];then
        return 1
    else
        return 0
    fi
    
}

divideEleven(){
    ((setOne=0))
    ((setTwo=0))
    for (( i = 0; i < ${#number}; ++i )); do
        ((imod=i%2))
        if [ $imod -eq 0 ];then
            ((setOne+=${number:$i:1}))
        else
            ((setTwo+=${number:$i:1}))
        fi
    done
    
    ((resultEleven=(setOne-setTwo)%11))
    if [ $resultEleven -eq 0 ];then
        return 1
    else
        return 0
    fi
}

divideThirteen(){
    ((resultThirteen=0))
    ((b=${number:(${#number}-1):1}))
    ((a=${number:0:-1}))
    ((resultThirteen= a - (4*b)))
    ((resultThirteen= resultThirteen%13))

    if [ $resultThirteen -eq 0 ];then
        return 1
    else
        return 0
    fi
}

divideSeventeen(){
    ((resultSeventeen=0))
    ((b=${number:(${#number}-1):1}))
    ((a=${number:0:-1}))
    ((resultSeventeen= a - (5*b)))
    ((resultSeventeen= resultSeventeen%17))

    if [ $resultSeventeen -eq 0 ];then
        return 1
    else
        return 0
    fi
}

divideNineteen(){
    ((resultNineteen=0))
    ((b=${number:(${#number}-1):1}))
    ((a=${number:0:-1}))
    ((resultNineteen= a - (2*b)))
    ((resultNineteen= resultNineteen%19))

    if [ $resultNineteen -eq 0 ];then
        return 1
    else
        return 0
    fi
    
}

divideTwentyThree(){
    ((resultTwentyThree=0))
    ((b=${number:(${#number}-1):1}))
    ((a=${number:0:-1}))
    ((resultTwentyThree= a - (7*b)))
    ((resultTwentyThree= resultTwentyThree%23))

    if [ $resultTwentyThree -eq 0 ];then
        return 1
    else
        return 0
    fi

}
