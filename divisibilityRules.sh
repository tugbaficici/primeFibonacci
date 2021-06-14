divideTwo(){
    if [ $number -eq 2 ];then
        return 0
    else
        ((resultTwo=$number % 2))
        if [ $resultTwo -eq 0 ];then
            return 1
        else
            return 0
        fi
    fi
}

divideThree(){
    if [ $number -eq 3 ];then
        return 0
    else
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
    fi
}

divideFive(){
    #last digit ${number:(${#number}-1):1}
    if [ $number -eq 5 ];then
        return 0
    else
        if [ ${number:(${#number}-1):1} -eq 0 -o ${number:(${#number}-1):1} -eq 5 ];then
            return 1
        else
            return 0
        fi
    fi
}

divideSeven(){
    if [ $number -eq 7 ];then
        return 0
    else
        ((resultSeven=0))
        if [ ${#number} -eq 1 ];then
            ((a=0))
        else
            ((a=${number:0:-1}))
        fi
        ((b=${number:(${#number}-1):1}))
        ((resultSeven= a - (2*b)))
        ((resultSeven= resultSeven%7))

        if [ $resultSeven -eq 0 ];then
            return 1
        else
            return 0
        fi
    fi
    
}

divideEleven(){
    if [ $number -eq 11 ];then
        return 0
    else
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
    fi
}

divideThirteen(){
    if [ $number -eq 13 ];then
        return 0
    else
        ((resultThirteen=0))
        ((b= ${number:(${#number}-1):1}))
        ((a= ${number:0:-1}))
        ((resultThirteen= a + (4*b)))
        ((resultThirteen= resultThirteen%13))

        if [ $resultThirteen -eq 0 ];then
            return 1
        else
            return 0
        fi
    fi
}

divideSeventeen(){
    if [ $number -eq 17 ];then
        return 0
    else
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
    fi
}

divideNineteen(){
    if [ $number -eq 19 ];then
        return 0
    else
        ((resultNineteen=0))
        ((b=${number:(${#number}-1):1}))
        ((a=${number:0:-1}))
        ((resultNineteen= a + (2*b)))
        ((resultNineteen= resultNineteen%19))

        if [ $resultNineteen -eq 0 ];then
            return 1
        else
            return 0
        fi
    fi
    
}

divideTwentyThree(){
    if [ $number -eq 23 ];then
        return 0
    else
        ((resultTwentyThree=0))
        ((b=${number:(${#number}-1):1}))
        ((a=${number:0:-1}))
        ((resultTwentyThree= a + (7*b)))
        ((resultTwentyThree= resultTwentyThree%23))

        if [ $resultTwentyThree -eq 0 ];then
            return 1
        else
            return 0
        fi
    fi
}
