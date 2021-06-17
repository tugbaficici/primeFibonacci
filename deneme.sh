
#!/bin/bash
source controlPrime.sh
echo "Lutfen bir sayi giriniz(Max: 4.100.200.300):"
read userNumber
 


sortedNumbers=()
fibo=()
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
        fibo+=($number)
    else
        sortedNumbers+=("F($count):$newnumber")
        #echo "F($count):$number"
    fi
    ((count+=1))
done


for (( i = ${#fibo[@]}-1; i >= 0; i-- )); do
    echo ${fibo[i]}
done 

echo ${fibo[${#fibo[@]}-1]}

for (( i = 25; i < ${fibo[${#fibo[@]}-1]}/2; i++ )); do
        for (( j = ${#fibo[@]}-1; j >= 0; j-- )); do
                ((modResult=number%i))
                if [ $modResult -eq 0 ];then
                ((isPrime=1))
                echo $number
                break
                fi
        done    
done 