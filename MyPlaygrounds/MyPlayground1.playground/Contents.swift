import UIKit

var name = "Emily"
var surname = "Brown"
var age = 22
print("""
Name:\(name)
Surname:\(surname)
age:\(age)
""")

print("  ")

var ad = "Jessy"
var soyad = "Walsh"
var adsoyad = ad + " " + soyad
print(adsoyad)

print("  ")

var message1 : String = "Hello"
var message2 : String = "Goodday"
var lastmessage = "\(message1 ) \(message2)"
//var lastmessage = message1 + "" + message2
print(lastmessage)



var namesurname = "Jennifer Jones"
namesurname.replacingOccurrences(of: "er", with: "ak")

print("  ")

var city = "Ankara"
city.append(" and Istanbul are two very beautiful cities")
print(city)

print("  ")

city.lowercased()
city.uppercased()
print(city.lowercased())
print(city.uppercased())


