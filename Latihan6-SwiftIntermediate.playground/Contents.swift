import UIKit

var greeting = "Hello, playground"

let temperature=24

if temperature <= 24{
    print("=====> Dingin Bingits")
}

let temperatureAC=30
if temperatureAC >= 30{
    print("====> Udara panas")
}else{
    print("====> Udara dingin")
}

// if-else boolean value
let temperaturRuangan=35
if temperaturRuangan>=35 && temperaturRuangan<=40 {
    print("=====> Udara Palembang banget deh")
}else if temperaturRuangan == 45{
    print("=====> Cikarang beut dah")
}else{
    print("=====> Warga culabaya udah biasa")
}

// switch statements
let krlDepartue = 6
switch krlDepartue{
case 4:
    print("KRL MASIH KOSONG")
case 6:
    print("KRL MULAI CHAOS")
case 7:
    print("UDAH JADI CAKWE GOYANG")
case 8:
    print("UDAH SIAP RESIGN AJA")
default:
    print("--------")
}

var flashSale: Int
let a=15
let b=4
if a>b{
    flashSale=a
}else{
    flashSale=b
}

// rewrite
flashSale = a > b ? a : b

//String Interpolation
let name = "John Wick"
let age = 50
print("=======>\(name)umurnya \(age)")

func displayPi(){
    print("3.141")
}
displayPi()


func triple(value:Int){
    let result = value * 3
    print("if u multiply \(value) u will be get \(result)")
}

triple(value:40)


func multiply(firstNumber: Int, secondNumber: Int){
    let result=firstNumber*secondNumber
    print("result is \(result)")
    
}
multiply(firstNumber: 2, secondNumber: 3)

func multiPly2(fourthNumber:Int,fifthNumber:Int)->Int{
    let result=fourthNumber+fifthNumber
    print("Result is \(result)")
    return result
}

//Function yang ada argumennya labels
func sayHello(to person:String, and anotherPerson:String){
    print("Hello \(person) and \(anotherPerson)")
    
}
sayHello(to: "John", and: "Lisa")

func add(_ firstNumber:Int, to secondNumber:Int)->Int{
    return firstNumber+secondNumber
}
add(20, to: 11)


// Struct
struct Shirt{
    var size: String
    var color:String
}
let myShirt=Shirt(size: "Color", color: "Blue")
let yourShirt=Shirt(size: "M", color: "Red")

var myDict:[String:Int]=[
    "a":1,
    "b":2,
    "c":3
]
//mengahpus item dari data dictionary
myDict.removeValue(forKey: "c")

//mengakses item dari dictionary
let item=myDict["b"]

//mengupdate item dari dictionary
myDict["a"]=5

//looping item di dalam dictionary
for(key,value) in myDict{
print("isi dictionary saya adalah \(key):\(value)")
}
let values = Array(myDict.keys)
print(values)

