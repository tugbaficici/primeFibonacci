# Bu dosyada ondalık gösterim için kullanılan noktaların silme ve ekleme fonksiyonları bulunmaktadır.

# Nokta silme fonksiyonu global olarak gelen userNumber değişkeninde bulunan noktaları temizler.
eraseDot(){
    ((userNumber=${userNumber//.}))
}

# Çıktı değerlere nokta eklemek için addDot fonksiyonu oluşturulmuştur.
# Mantığı gelen sayının ilk olarak nokta dışında en solunda kalan(varsa) rakamların 
# kaç tane olduğu hesaplanıp direk noktalı sayı için oluşturulan değişkene eklenmesidir.
addDot(){
    if [ ${#number} -gt 3 ];then                                        # Nokta eklenebilmesi için sayının 3 haneden büyük olmasın gerekir.

        ((kalan=${#number}%3))                                          # En soldaki noktanın solunda kalan rakamların sayısı hesaplanır.
        newnumber=""                                                    # Yeni oluşturulacak sayı için değişken 1
        dot="."                                                         # Nokta değişkeni
        number2=""                                                      # Yeni oluşturulacak sayı için değişken 2

        if [ $kalan -ne 0 ];then                                        # Kalan rakamların sayısına göre en soldaki rakamlar $number değişkeninden
                for (( i =0 ; i <$kalan; i++ )); do                     # alınarak newnumber değişkenine eklenir. Bu işlem sonucu alınmayan kısım
                        newnumber="${newnumber}${number:$i:1}"          # $number2 değişkeninde tutulur.
                        
                done 
                number2=${number:$kalan:(${#number}-$kalan)}
                newnumber="${newnumber}${dot}" 
        else
                number2=$number                                         # Eğer hiç kalan yoksa $number2 değişkenine number değişkeni atanır. Bunun
        fi                                                              # yapılma sebebi number değişkenin aynı kalmasının istenmesidir.

        for (( i =1 ; i <${#number2}+1; i++ )); do                      # Kalan rakamlar için ilk olarak mod 3 işlemi yapılarak üçer üçer ayrılması
                ((moddot=i%3))                                          # sağlanır. 
                if [ $moddot -eq 0 ];then
                        newnumber="${newnumber}${number2:$i-1:1}"       # Her üçlüden newnumber değişkenine eklendikten sonra nokta eklenir.
                        newnumber="${newnumber}${dot}"                  
                        
                else
                        newnumber="${newnumber}${number2:$i-1:1}"
                fi

        done
        newnumber=${newnumber:0:${#newnumber}-1}                        # En son olarak fazladan eklenen nokta silinir.
        
    else
        newnumber=$number                                               # Eğer number değişkeni 3 haneden küçükse direk newnumber değişkenine atılır.   
    fi
}