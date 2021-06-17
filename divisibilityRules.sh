# Bu dosyada asal olan bölme kuralları bulunmaktadır.
# Asal olmayan bölme kurallarının yazılmama sebebi kuralın kendinden önce bir başka sayısa bölünmesidir.
# Bu durum asallık durumunu ortadan kaldırır.
# Her kural için bölünüyorsa 1 bölünmüyorsa 0 değeri döndürülmektedir.


# 2'ye bölünme kuralı
divideTwo(){                                        # Sayı 2'ye bölündüğünde kalansız bölünüyorsa bu kurala uyar 
    if [ $number -eq 2 ];then
        return 0
    else
        ((resultTwo=$number % 2))                   # Bu kural için mod 2 işlemi yapılmaktadır.
        if [ $resultTwo -eq 0 ];then
            return 1
        else
            return 0
        fi
    fi
}

# 3'ye bölünme kuralı
divideThree(){                                      # Sayının 3'e bölünmesi için rakamlarının toplamının 3'ün katı olması gerekir.
    if [ $number -eq 3 ];then
        return 0
    else
        ((resultThree=0))
        for (( i = 0; i < ${#number}; ++i )); do    # İlk olarak rakamlar toplanır.
            ((resultThree+=${number:$i:1}))
        done
        ((resultThree=resultThree%3))               # Mod 3 işlemi yapılarak kontrol edilir.
        if [ $resultThree -eq 0 ];then  
            return 1
        else
            return 0
        fi
    fi
}

# 5'ye bölünme kuralı
divideFive(){                                       # Sayının 5'e bölünmesi için son rakamın 0 veya 5 olması gerekir                          
    #last digit ${number:(${#number}-1):1}
    if [ $number -eq 5 ];then
        return 0
    else
        if [ ${number:(${#number}-1):1} -eq 0 -o ${number:(${#number}-1):1} -eq 5 ];then # Son rakam direk kontrol edilir.
            return 1
        else
            return 0
        fi
    fi
}

# 7'ye bölünme kuralı
divideSeven(){                                      # 7'ye bölünme kuralında sayı 10a+b şeklinde yazılmalıdır.
    if [ $number -eq 7 ];then
        return 0
    else
        ((resultSeven=0))
        if [ ${#number} -eq 1 ];then
            ((a=0))                                 # Tek rakamdan oluşan sayılar için kontrol eklenmiştir.
        else
            ((a=${number:0:-1}))                    # Bunun için sayının son rakamı silinerek a değişkenine atılır.
        fi
        ((b=${number:(${#number}-1):1}))            # B için son rakam alınır.
        ((resultSeven= a - (2*b)))                  # A ve b bulunduktan sonra a-2b hesaplanır ve 7'nin katı olup olmadığı kontrol edilir.
        ((resultSeven= resultSeven%7))

        if [ $resultSeven -eq 0 ];then
            return 1
        else
            return 0
        fi
    fi
    
}

# 11'ye bölünme kuralı
divideEleven(){                                     # 11'ye bölünme kuralında sayı iki sete ayrılır.
    if [ $number -eq 11 ];then
        return 0
    else
        ((setOne=0))
        ((setTwo=0))
        for (( i = 0; i < ${#number}; ++i )); do
            ((imod=i%2))                            # Çift sıradaki rakamlar ve tek sıradaki rakamlar ayrı ayrı toplanır
            if [ $imod -eq 0 ];then
                ((setOne+=${number:$i:1}))
            else
                ((setTwo+=${number:$i:1}))
            fi
        done
        
        ((resultEleven=(setOne-setTwo)%11))         # Setler birbirinden çıkartılarak 11'in katı olma durumu kontrol edilir.
        if [ $resultEleven -eq 0 ];then
            return 1
        else
            return 0
        fi
    fi
}

# 13'ye bölünme kuralı
divideThirteen(){                                   # 13'ye bölünme kuralında sayı 10a+b şeklinde yazılmalıdır.
    if [ $number -eq 13 ];then
        return 0
    else
        ((resultThirteen=0))
        ((b= ${number:(${#number}-1):1}))           # B için son rakam alınır.
        ((a= ${number:0:-1}))                       # Bunun için sayının son rakamı silinerek a değişkenine atılır.
        ((resultThirteen= a + (4*b)))               # A ve b bulunduktan sonra a+4b hesaplanır ve 13'nin katı olup olmadığı kontrol edilir.
        ((resultThirteen= resultThirteen%13))

        if [ $resultThirteen -eq 0 ];then
            return 1
        else
            return 0
        fi
    fi
}

# 17'ye bölünme kuralı
divideSeventeen(){                                  # 17'ye bölünme kuralında sayı 10a+b şeklinde yazılmalıdır.
    if [ $number -eq 17 ];then
        return 0
    else
        ((resultSeventeen=0))
        ((b=${number:(${#number}-1):1}))            # B için son rakam alınır.
        ((a=${number:0:-1}))                        # Bunun için sayının son rakamı silinerek a değişkenine atılır.
        ((resultSeventeen= a - (5*b)))              # A ve b bulunduktan sonra a-5b hesaplanır ve 17'nin katı olup olmadığı kontrol edilir.
        ((resultSeventeen= resultSeventeen%17))

        if [ $resultSeventeen -eq 0 ];then
            return 1
        else
            return 0
        fi
    fi
}

# 19'ye bölünme kuralı
divideNineteen(){                                   # 19'ye bölünme kuralında sayı 10a+b şeklinde yazılmalıdır.
    if [ $number -eq 19 ];then
        return 0
    else
        ((resultNineteen=0))
        ((b=${number:(${#number}-1):1}))            # B için son rakam alınır.
        ((a=${number:0:-1}))                        # Bunun için sayının son rakamı silinerek a değişkenine atılır.
        ((resultNineteen= a + (2*b)))               # A ve b bulunduktan sonra a+2b hesaplanır ve 19'nin katı olup olmadığı kontrol edilir.
        ((resultNineteen= resultNineteen%19))

        if [ $resultNineteen -eq 0 ];then
            return 1
        else
            return 0
        fi
    fi
    
}

# 23'ye bölünme kuralı
divideTwentyThree(){                                # 23'ye bölünme kuralında sayı 10a+b şeklinde yazılmalıdır.
    if [ $number -eq 23 ];then
        return 0
    else
        ((resultTwentyThree=0))
        ((b=${number:(${#number}-1):1}))            # B için son rakam alınır.
        ((a=${number:0:-1}))                        # Bunun için sayının son rakamı silinerek a değişkenine atılır.
        ((resultTwentyThree= a + (7*b)))            # A ve b bulunduktan sonra a+7b hesaplanır ve 23'nin katı olup olmadığı kontrol edilir.
        ((resultTwentyThree= resultTwentyThree%23))

        if [ $resultTwentyThree -eq 0 ];then
            return 1
        else
            return 0
        fi
    fi
}
