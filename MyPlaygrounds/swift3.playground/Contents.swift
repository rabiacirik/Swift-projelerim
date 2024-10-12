import UIKit


                             //İNT8 MAX MİN VALUES
//let maxint : Int8 = 127
//let minint : Int8 = -128

print("int max value:\(Int8.max) int min value:\(Int8.min)")

//Method 2
print(INT8_MAX)
print(INT8_MIN)


//var value : UInt8 = -10  doesn't take negative values
  var deger : UInt8 = 10

print("max and min values for UInt8")
print("max değer:\(UInt8.max)  min değer:\(UInt.min)")


 //int bir sayının boyut değeri
let total = 1900
var sizevalue = MemoryLayout.size(ofValue: total)
print("size total:\(sizevalue) byte")

//string bir ifadenin boyut değeri
let word = "Ali"
sizevalue = word.utf8.count
print("size total:\(sizevalue)")

//değişkenin tipi
print(type(of: Int8.max))
print(type(of: word))
print(type(of: sizevalue))

                     //FLOAT and DOUBLE
var f1 : Float = 3.4
print(f1)

var MileageValue : Double = 108.5
print(MileageValue)

print(type(of: f1))
print(type(of: MileageValue))

var weight1 : Double = 63.8
var weight2 : Int = 8
//kilosu=kilosud  hatalı kullanım
weight2=Int(weight1)
print(weight2)
weight1=Double(weight2)
print(weight1)

print(Double(30))
print(30)

                //FLOAT DOUBLE MAX MİN VALUES
print(Double.greatestFiniteMagnitude)//max
print(Double.leastNormalMagnitude)//min
print(Float.greatestFiniteMagnitude)//max
print(Float.leastNormalMagnitude)//min


//*******************

print(MemoryLayout.size(ofValue: Float.init()))
print(MemoryLayout.size(ofValue: Float32.init()))
print(MemoryLayout.size(ofValue: Float64.init()))

     //BOOLEON(BOOL) DEĞİŞKEN TİPİ

var value1 : Bool = true
var value2 = true
var value3 : Bool
value3 = false

print(value1)
print(type(of: value1))

print(value3)
print(type(of: value3))

var num1 = 3.4
var num2 = 2.5
var result = num1>num2  //sayi1 sayi2 den büyük müdür
print("type of result variable: \(type(of: result))")
print(result)

var name = "Mehmet"
var surname = "Ersoy"
var marialStatus = true //evli

print("""
Adı:\(name)
soyadi:\(surname)
marial status:\(marialStatus == true ? " EVLİ" : "BEKAR")
""")

let d1 : Bool = Bool(truncating: 28)
print(d1)
let d2 : Bool = Bool(truncating: 0)
print(d2)
let d3 : Bool = Bool(truncating: -228)
print(d3)

//matematiksel karşılığı
let s1 = NSNumber(value: d1) //d1 = true
let s2 = Int(truncating: NSNumber(value: d2)) //d2 = false
print(s1)
print(s2)
 
//boyut değeri
let boyut1 = MemoryLayout<Bool>.size
print("Boolean değişkenin boyutu \(boyut1) byte")

let d4 = true
let boyut2 = MemoryLayout.size(ofValue: d4)
print("Boolean değişkenin boyutu \(boyut2) byte")





