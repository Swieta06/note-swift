import UIKit

var accountName="kopi surgawi"
var followers=363
print(followers)
followers=089
print(accountName+" followersnya",followers)
print("\(accountName) followersnya \(followers)")


let contactPerson="088888888"
var userCategory="personal blogger"
var following=356
var persetageFollowing=floor(0.3)
print(following*Int(persetageFollowing))

var a=2
var b=4
var c=6
var d=3

print(a+b)
print(c-b)
print(a*b*c)
print(b/a)
print(b%d)
print(b%a)

var age = 17
let aNumber=1
let bNumber=2
aNumber == bNumber
aNumber != bNumber
aNumber > bNumber
aNumber <= bNumber


let isTiktoActive = true
let isTwitterActive=false

if(!isTiktoActive){
    print("gak punya akun")
    
}else{
    print("punya akun tiktok")
}
isTiktoActive && isTwitterActive
isTiktoActive || isTiktoActive

let userReels = 9
if userReels<10{
    print("he is not influencer because reels is less than 10")
}

var rateCard=5000

if rateCard >= 10000{
    print("He/she is macro influencer")
}else if rateCard>=5000&&rateCard<10000{
    print("He/she is onbuget influencer")
}else if rateCard >= 1000 && rateCard < 5000{
    print("he / she is micro influencer")
}else{
    print("he / she is inexperience influencer")
}

let value = 1
switch value{
case 1,2,3:
    print("lorem ipsum")
default:
    print("default")
}
