import UIKit
//ARİTHMATİC OPERATİONS
let NUM1 = 12
let NUM2 = 14
let result = NUM1 + NUM2

let NUM3 : Double = 13.2
//let sonuc 2 = NUM3 + NUM1 => Misuse => variable types are different

//MOD ALMA İŞLEMİ
let s1 = 10
let s2 = 3
var answer = s1 % s2

let s3 : Double = 10.0
let s4 : Double = 3
//var cevap = s3 % s4 => Misuse => % is not used in variables double and float

s3.truncatingRemainder(dividingBy: s4)  //mod alma işlemini yapar

var s5 = 10
s5 = s5 + 10
s5+=5
s5-=10
s5 %= 2

//string ifadelerde sadece toplama işlemi kullanılır
var sentence1 : String = "karanlıktayım korkuyorum "
var sentence2 : String = "Işığımı bulmaya ihtiyacım var"
var sentence = sentence1 + sentence2
print(sentence)

//işlem önceliği
//  ()  %   * ve /  + ve -


      //OPTİONAL VARİABLES
var d1 : Int = 23
print(d1)

var d3 : Int? // opitional
print(d3)

var d4 : Int? = 10
var d5 : Int? = d4 ?? 0 // d4 içinde değer varsa kullan yoksa sıfırı ata
print(d5!) // ünlem işareti çıktıda opitional yazısını kaldır

 
