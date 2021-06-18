#!/bin/bash
# 30116005 - Tuğba FIÇICI
# Yazılan kod "bash" kabuğunda derlenip kullanılmıştır.

# Kullanılan fonksiyonlara göre fonksiyon dosyaları eklenmiştir.
source controlPrime.sh
source dotFunction.sh

# Kullanıcıdan değer alınması:
while [ true ]                                                      # Kullanıcı hatalı giriş yaptığında yeniden değer girebilmesi için
do                                                                  # sonsuz döngü eklenmiştir.
    echo "Lutfen bir sayi giriniz(Max: 4.100.200.300):"             # Soru stringi
    read userNumber                                                 # Kullanıcıdan alınan değer
    eraseDot                                                        # Alınan değerin noktalarının temizlenmesi
    if [ $userNumber -lt 0 -o $userNumber -gt 4100200300 ];then     # Alınan sayının belirlenen aralıkta olmama ihtimaline karşı kontrol
        echo "Girilen sayi gecersizdir."                            # Hata mesajı
    else
        break                                                       # Hata alınmaması durumunda sonsuz döngünün kırılması
    fi
done


sortedNumbers=()                                                    # Sayıların sıralanması için oluşturulan dizi
((number=0))                                                        # İşlenen değeri tutan değişken
((count=1))                                                         # Hesaplanan fibonacci sayılarının sayısı
((first=0))                                                         # Fibonacci sayılarının hesabı için 1. değer ataması
((second=1))                                                        # Fibonacci sayılarının hesabı için 2. değer ataması
sortedNumbers+=("F(0):1(Asal)")                                     # İlk 1 değeri sabit olduğu için listeye eklenir

while [ $number -le $userNumber ]                                   # Hesaplanan fibonacci sayısının girilen sayıdan küçük-eşit olması durumunda
do                                                                  # döndü döner.
    ((number=first+second))                                         # Fibonacci İşlemleri: ilk iki sayının toplanması
    ((first=second))                                                # Fibonacci İşlemleri: ikinci sayının ilk değere
    ((second=number))                                               # Fibonacci İşlemleri: hesaplanan sayının ikinci değere atılması
    
    divisibilityRulesControl                                        # Kontrol edilecek sayı hesaplandıktan sonra bölünme kurallarının kontrolü için
    returnController=$?                                             # divisibilityRulesControl fonksiyonu çağırılır ve geri dönen değer alınır.
    if [ $returnController -eq 0 ];then                             # Controller değerinin 0 olması durumunda genel asallık kontrolü yapılması için
        generalPrimeControl                                         # ilgili fonksiyon çağırılır.
        returnPrimeController=$?
        if [ $returnPrimeController -ne 0 ];then                    # Bu fonksiyondan dönen değer 0 ise sortedNumbers dizisine asal etiketi ile
            addDot                                                  # sayıya nokta eklenerek(addDot fonksiyonu) sortedNumbers dizisine pushlanır. 
            sortedNumbers+=("F($count):$newnumber(Asal)")
            #echo "F($count):$number(Asal)"
        else
            addDot                                                  # Dönen değer 1 ise sayıya noktalar eklenerek ilgili diziye pushlanır.
            sortedNumbers+=("F($count):$newnumber")
            #echo "F($count):$number"
        fi
    else
        #zaten bölünmüş prime değil yazıcak ekrana
        addDot                                                      # Bölünme kurallarından dönen değer 0 ise sayıya sadece noktalar eklenerek diziye pushlanır.
        sortedNumbers+=("F($count):$newnumber")
        #echo "F($count):$number"
    fi
    
    ((count+=1))                                                    # While değişkeni arttırılır.
done

for (( i = ${#sortedNumbers[@]}-1; i >= 0; i-- )); do               # Sayıların ters sırada sıralanması için for döngüsü düzenlenir ve ekrana
    echo ${sortedNumbers[i]}                                        # çıktı olarak sayılar yazılır.
done 

                                                                    # Program sonlanır.



