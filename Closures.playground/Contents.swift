import UIKit

var greeting = "Hello, playground"

let people=["Jack Ryan","John Wick","Json Bournce","James Bond","Tom Clancys","Sam Fisher",
           "Jack Ryan Jr","james Greer","Kathlen Ryan","Scott Mitchell","Sam Driscoll"
]
// contoh closures dengan parameter dan return type
let theRyans=people.filter({(name: String)-> Bool in
    return name.contains("Ryan")
})
//Contoh Closures dimana return typenya bisa di omit(dihilangkan)

let theJacks=people.filter{name in
    return name.contains("Ryan")
}
//Shorthand closures, $0,$1 sebagai pengganti argumen
let theJacksPart2=people.filter({$0.contains("Jack")})
theJacksPart2

let theJacksPart3=people.filter{$0.contains("Jack")}
theJacksPart3
