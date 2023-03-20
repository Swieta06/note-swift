import UIKit
print("=========== 1. VARIABLE & CONTSTAN ===========")
/*
 Latihan 1
 
 `x = y + 10`
 tentukan yang mana yang jadi variable, yang mana yang jadi constant dan ketika print(x) hasilnya 40*/
print("=> Latihan 1 ")
print("1. x = y + 10 Tentukan yang mana yang jadi variable, yang mana yang jadi constant dan ketika print(x) hasilnya 40 ?")
let z=10
let y=30
var x=y+z
print(String(x)+" = "+String(y)+" + "+String(z))


/*
 Latihan 2
 **String Concatenation**

 Variabel `content` menampung dua value dari variable `greeting` dan variable `place`

 Dimana output dari variable content ketika di print adalah:

 `Selamat datang di Kopi Surgawi`

 Pertanyaan:

 1. Bagaimana output diatas apabila ditulis dalam Swift Code?
 2. Tuliskan dalam Swift code, total jumlah karakter yang ada di variable `count`
 3. Buat output dari variable `content` menjadi huruf kapital semuanya
 4. Buat ouput dari variable `content` menjadi huruf kecil semuanya
 */
print("\n=> Latihan 2 ")
var greeting="Selamat Datang"
var place="Kopi Surgawi"
var content = greeting+" di "+place
print("1. Bagaimana output diatas apabila ditulis dalam Swift Code? ")
print(content)

print("2. Tuliskan dalam Swift code, total jumlah karakter yang ada di variable `count`")
var arrayString=Array(content)
//print(arrayString)
var tmp=""
for contents in arrayString where contents != " "{
    tmp=tmp+String(contents)
}
print("karakter : "+tmp)
var count=tmp.count
print("count : ",count)

print("3. Buat output dari variable `content` menjadi huruf kapital semuanya")
var upperCaseText=content.uppercased()
print(upperCaseText)
print("4. Buat ouput dari variable `content` menjadi huruf kecil semuanya")
var lowerCaseText=content.lowercased()
print(lowerCaseText)

/*
 **Latihan 3:**

 **String Interpolation**

 Seorang Barista memberikan struk pembayaran kepada pelanggan. Isi dari struk tersebut sebagai berikut:

 `Total price you should pay is IDR 500000`

 **Diketahui**:

 - `coffeePrice` adalah harga satuan dari kopi
 - `amountOfCoffee` adalah jumlah stok kopi
 - `totalPrice` adalah harga satuan kopi dikalikan dengan jumlah stok kopi
 - `billMessage` adalah struk pembayaran yang isinya: `Total price you should pay is IDR 500000`

 **Ditanyakan**:
 Bagaimana syntax Swift nya?
 */
print("\n=> Latihan 3")
let coffeePrice = 50000
let amountOfCoffe = 10
var totalPrice=coffeePrice*amountOfCoffe
print("=====================")
print("   Payment Struck    ")
print("=====================")
print("Coffee Price     : IDR "+String(coffeePrice))
print("Amount Of Coffe  : "+String(amountOfCoffe))
print("Total Price      : IDR "+String(totalPrice))
print("---------------------")
var billMessage="Total price you should pay is IDR "+String(totalPrice)
print(billMessage)
print("=====================")

print("\n=========== 2. IF STATEMENT ===========")
/***Latihan 1:**
 
 Sebagai Barista shift pagi, Rana harus bangun sebelum jam 6 pagi karena Kopi Surgawi akan dibuka pada jam 7 pagi.

 Jika Rana bangun lewat dari jam 6 pagi, akan muncul pesan `You will be late, Rana!`

 Jika Rana bangun sebelum jam 6 pagi, akan muncul pesan `Way to go! Keep Spirit`

 Bagaimana Swift syntax nya?*/
print("=> Latihan 1 ")

let working=9
print("Go to work at : "+String(working)+" o'clock")
if(working<=6&&working>=0){
    print("Way to go! Keep Spirit")
}else{
    print("You will be late, Rana!")
}
/*
 **Latihan 2:**

 Sesampainya di Kopi Surgawi, pesanan pertama datang dari pelanggan pecinta kopi.

 Rana menyiapkan resep kopi andalannya. Catatan resepnya seperti ini:

 **Diketahui:**

 - Blooming interval maksimal adalah 225 mili liter. Lewat dari 225 ml, kopi akan terasa pahit dan kecut
 - Pouring (seduhan) pertama dimulai di 30 ml. Di catatannya tertulis `First interval and start pouring`
 - Jika pouringnya diantara 30 ml hingga 90 ml, di catatannya tertulis `Second interval, after then wait until thirty second`
 - Jika pouringnya diantara 90 ml hingga maksimal 180 ml, di catatannya tertulis `Third interval, after then wait until twenty five second`
 - Jika pouringnya antara 180 ml hingga kurang dari 225 ml, di catatannya tertulis `Resting interval and your coffee are ready to serve`
 - Jika pouringnya melebihi 225 ml, maka citarasa kopi akan `Over resting`

 **Ditanyakan**:

 - Bagaimana Swift syntax nya apabila menggunakan `switch case`?
 */
print("\n=> Latihan 2 ")
let recipe = 226

switch recipe {
case 0...30:
    print("First interval and start pouring")

case 30...90:
    print("Second interval, after then wait until thirty second")

case 90...180:
    print("Third interval, after then wait until twenty five second")
    
case 180...224:
print("Resting interval and your coffee are ready to serve")
default:
    print("Over resting")
}

print("=========== 3. FOR IN LOOPS ===========")
/***Latihan 1**
 
 **Diketahui:**

 Pagi ini di Kopi Surgawi, sudah datang 5 pelanggan yang datang bergantian. Mereka bernama:

 - Anna
 - Hendry
 - Disa
 - Wendy
 - Ryan

 Sebagai Barista yang ramah, sudah menjadi kewajiban Rana untuk menyapa nama mereka ketika memesan kopi
 
 Halo selamat datang di Kopi Surgawi, Anna
 Halo selamat datang di Kopi Surgawi, Hendry
 Halo selamat datang di Kopi Surgawi, Disa
 Halo selamat datang di Kopi Surgawi, Wendy
 Halo selamat datang di Kopi Surgawi, Ryan
 */
print("=> Latihan 1")
let customers=["Anna","Hendry","Disa","Wendy","Ryan"]
for customer in customers{
    print("Halo selamat datang di Kopi Surgawi, "+customer)
}
/*
 **Latihan 2**:

 Masing-masing pengunjung memesan menu kopi yang berbeda-beda

 **Diketahui:**

 - Menu kopi pesanan **Anna** adalah **Vanilla Latte**
 - Menu kopi pesanan **Hendry** adalah **Cold White**
 - Menu kopi pesanan **Disa** adalah **Ice Americano**
 - Menu kopi pesanan **Wendy** adalah **Ice Japanese**
 - Menu kopi pesanan **Ryan** adalah **Ice Coffee Surgawi**

 **Ditanyakan:**

 - Buat dalam Swift syntax untuk memunculkan output sebagai berikut:
 
 Pesanan Ice Coffee Surgawi atas nama kak Ryan sudah ready!
 Pesanan Vanilla Latte atas nama kak Anna sudah ready!
 Pesanan Ice Americano atas nama kak Disa sudah ready!
 Pesanan Cold White atas nama kak Hendry sudah ready!
 Pesanan Ice Japanese atas nama kak Wendy sudah ready!
 */
print("\n=> Latihan 2")

let arrOrders=["Ryan":"Ice Coffee Surgawi","Anna":"Vanilla Latte","Disa":"Ice Americano","Hendry":"Cold White","Wendy":"Ice Japanese"]

for (name,order) in arrOrders{
    print("Pesanan "+order+" atas nama kak "+name+" sudah ready! ")
}
