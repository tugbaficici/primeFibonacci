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
# Genel asallık kontrolü için ilk olarak geleneksel yöntem denenmiştir. 
# Geleneksel yöntem 7 basamak sayıdan sonrası için çok fazla zaman harcıyordu ve bitmesini beklemek dakikalarca sürüyordu.
# Bu problemi ortadan kaldırmak için araştırma yapıldığında birden fazla farklı yöntem ve teoriler vardı.
# Shell programlama için en uygun adapte edilen yöntem 6k+1 yöntemi olduğu için bu yöntem seçilmiştir.
generalPrimeControl(){
    # Döngü içerisinde ilk olarak 5 sayısından başlanarak sayının bölümleri kontrol edilir.
    # Bölen altışar artırılır ve bölen * bölen sınırına kadar kontrol edilir.
    # Bu yöntemin ana noktası aslında küçük toplama çıkarma işlemi ile bütün sayıları elde etmemizdir.
    # Bu şekilde sayının her bölen olma ihtimalini kontrol etmiş oluruz.
    for (( i = 5 ; i * i <= number ; i += 6 )); do 
        if [ $(($number % i)) -eq 0 -o $(($number % (i + 2))) -eq 0 ];then
            return 0 
        fi
    done
    return 1  
    # Döngü bir bölen bulduğunda 0 değerini döndürür.
    # Asallığı doğrulanmış sayı için ise 1 değerini döndürür.
}

