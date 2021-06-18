//
//  main.swift
//  AdvancedSwift
//
//  Created by Ali Atakan AKMAN on 18.06.2021.
//

import Foundation


//******************************************Struct WS Class**************************************************

/*
 Struct -> Sınıfla hemen hemen aynı olan structlar, inheritance kullanılmaz(en büyük dezavantaj).
    stack'ta çalışıyor -> filo operasyonu (first in last out) -> Daha hızlı, daha basit.
    Value type
    inmutable
    no objective-c
    -> Kendi kendine init işlemi yapıyor. İnit fonksiyonuna ve ilk değer atamasına gerek yok. 
*/




/*
 Class -> inheritance kullanılır.
    heap te çlışıyor -> fifo operasyonu (firt in first out)
    reference type
    mutable
    objective-c

*/





let atakanSinif = UserClass(isim: "Atakan", yas: 22, meslek: "Yazılımcı")
//print(atakan.isim)

// let atakanStruct = UserStruct(isim: "Atakan", yas: 22, meslek: "Yazılım Müh")
var atakanStruct = UserStruct(isim: "Atakan", yas: 22, meslek: "Yazılım Müh")
//print(atakanStruct.isim)


atakanSinif.yas = 33
print(atakanSinif.yas)


atakanStruct.yas = 33
print(atakanStruct.yas)


/*
1
    Referans ve Değer farklı
 
    referans tiplerde -> class (kopyalama yapıldığında tek obje ve iki referans var.
 
    değer tipi -> Struct (kopyalama yapıldığında iki obje oluyor.

 */

let atakanSinifKopyası = atakanSinif
var atakanStructKopyası = atakanStruct

//
//print(atakanSinifKopyası.yas)
//print(atakanStructKopyası.yas)


atakanStructKopyası.yas = 34
atakanSinifKopyası.yas = 34

//print(atakanSinifKopyası.yas)
//print(atakanStructKopyası.yas)
//print(atakanSinif.yas)
//print(atakanStruct.yas)

print(atakanSinif.yas)

atakanSinif.yasiBirArttir()

print(atakanSinif.yas)


print(atakanStruct.yas)

atakanStruct.yasiBirArttir()

print(atakanStruct.yas)





//******************************************Tuple**************************************************


var benimTuple = (10,20)

print(benimTuple.0)



var benimTuple2 = (1,2,3,4)


print(benimTuple2.3)

benimTuple2.3 = 50

print(benimTuple2.3)


let bebinTuple3 = ("atakan",22)

print(bebinTuple3.0)

let benimTuple4 = ("atakan",[1,2,3,4])


print(benimTuple4.1[2])


let benimNumaram : Int?

let benimOnceBelirlenenTuple : (String, String)

benimOnceBelirlenenTuple.0 = "Atakan"
benimOnceBelirlenenTuple.1 = "AKMAN"

print(benimOnceBelirlenenTuple)


let yeniTuple = (isim : "Atakan" , soyisim : "Akman")


print(yeniTuple.isim)




//************************************************************Guard Let*****************************************************************************

// Yapılacak işlemin olmadığı durumda sıkıntı çıkarır. Biraz daha korumacıdır. Direk olmazsa ihtimalini düşünüyoruz.


let numaraStringi = "atakan"

func inteCevirenIfLetFonksiyonu(string : String) -> Int {
    if let benimInteger = Int(string) {
        return benimInteger
    }else{
        return 0
    }
}


func inteCevirenGuardLetFonksiyonu(string : String) -> Int {
    guard let benimInteger = Int(string) else {
        return 0
    }
    return benimInteger
}


print(inteCevirenIfLetFonksiyonu(string: numaraStringi))

print(inteCevirenGuardLetFonksiyonu(string: numaraStringi))


