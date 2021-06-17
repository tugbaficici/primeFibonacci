# Bu dosyada bölünmme kurallarının işlenmesi ve gerekirse asal sayı kontrolü yapılması için fonksiyonlar oluşturulmuştur.

# Bölünme kurallarının olduğu dosya eklenmiştir.
source divisibilityRules.sh

# Bölünme kurallarının kontrolü için değişken tanımlanmıştır.
# Kontrollerden dönen değerler ile controller değişkeni OR'lanarak herhangi bir kuraldan 1 gelmesi durumu kontrol edilmektedir.
declare -i controller
controller=0

# Bölünme kurallarının tek tek çağırılarak işlenmesi sağlanmaktadır. İşlenen değişken globaldir.
divisibilityRulesControl(){
    ((controller=0))
    divideTwo                                       # 2'ye Bölünme Kuralı
    returnValue=$?                                  # Dönen değer
    ((controller=controller || returnValue))        # OR işlemi
    divideThree                                     # 3'ye Bölünme Kuralı                                 
    returnValue=$?                                  # Dönen değer
    ((controller=controller || returnValue))        # OR işlemi
    divideFive                                      # 5'ye Bölünme Kuralı
    returnValue=$?                                  # Dönen değer
    ((controller=controller || returnValue))        # OR işlemi
    divideSeven                                     # 7'ye Bölünme Kuralı
    returnValue=$?                                  # Dönen değer
    ((controller=controller || returnValue))        # OR işlemi
    if [ ${#number} -ne 1 ];then                    # Tek rakamlı sayıların if içinde bulunan kontrollere girmesi engellenmiştir.
        divideEleven                                # 11'ye Bölünme Kuralı
        returnValue=$?                              # Dönen değer
        ((controller=controller || returnValue))    # OR işlemi
        divideThirteen                              # 13'ye Bölünme Kuralı
        returnValue=$?                              # Dönen değer
        ((controller=controller || returnValue))    # OR işlemi
        divideSeventeen                             # 17'ye Bölünme Kuralı
        returnValue=$?                              # Dönen değer
        ((controller=controller || returnValue))    # OR işlemi
        divideNineteen                              # 19'ye Bölünme Kuralı
        returnValue=$?                              # Dönen değer
        ((controller=controller || returnValue))    # OR işlemi
        divideTwentyThree                           # 23'ye Bölünme Kuralı
        returnValue=$?                              # Dönen değer
        ((controller=controller || returnValue))    # OR işlemi
    fi

    return $controller                              # Fonksiyon controller değişkenini geri döndürür.
                                                    # Değişken değeri 0 ise verilen kurallara bölünmemiştir.
                                                    # Değişken değeri 1 ise en az bir kurala bölünmüştür.
}


# Eğer kurallara uymuyorsa değişken genel asallık kontrolüne girer.
generalPrimeControl(){
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

