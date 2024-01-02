import Foundation

struct Fahrenheit {
    var temperature: Double
    init() {
        temperature = 32.0
    } // 초기화 구문에서 초기값 설정
}
var f = Fahrenheit()
print("\(f.temperature)") // 32.0


struct Celsius {
    
    var temperatureInCelsius: Double
        init (fromFahrenheit fahrenheit: Double) {
            temperatureInCelsius = (fahrenheit - 32.0) / 1.8
        }
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
}
let boilingPointOfWater = Celsius(fromFahrenheit: 212.0) //100.0
let freezingPointOfWater = Celsius(fromKelvin: 273.15) //0.0


struct Color {
    let red, green, blue: Double
    
    init(red: Double, green: Double, blue: Double) {
        self.red = red
        self.green = green
        self.blue = blue
    }
    init (white: Double) {
        red = white
        green = white
        blue = white
    }
}

let magenta = Color(red: 1.0, green: 1.0, blue: 1.0)
let halfGray = Color(white: 0.5)






///옵셔널 프로퍼티
struct SurveyQuestion {
    
    var text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    mutating func ask() {
        self.text = "Hi"
    }
}
var sq = SurveyQuestion(text: "Hello")
print(sq.text) //Hello
sq.ask()
print(sq.text) // Hi
sq.response = "How are you?"
if let response = sq.response {
    print(response) //How are you?
}

class ShoppingListItem {
    var name: String?
    var quantity :Int = 1
    var purchased = false
    
}
let item = ShoppingListItem()

struct ShoppingList {
    var name: String?
    var quantity: Int = 1
    var purchased = false
}
var shoppingList = ShoppingList(name: "goods", quantity: 2, purchased: true)
var list = ShoppingList(name: "note") //프로퍼티 모두 초기화되어 있어서 가능
print(list.name!, list.quantity) // note 1





///초기화 위임
struct Size {
    var width: Double = 0.0
    var height: Double = 0.0
}
struct Point {
    var x: Double = 0.0
    var y: Double = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size() // 초기화
    
    init() {} // 모든 프로퍼티의 값이 0.0
    
    init(origin: Point, size: Size) {
        self.origin = origin
        self.size = size
    } // 프로퍼티들의 값만 수정 가능
    
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

let basicRect = Rect() //모든 프로퍼티의 값이 0.0
let originRect = Rect(origin: Point(x: 2.0, y: 2.0), size: Size(width: 5.0, height: 5.0))
let centerRect = Rect(center: Point(x: 4.0, y: 4.0), size: Size(width: 3.0, height: 3.0))
//다른 초기자를 가져와 일을 맡김(위임)




///지정 생성자
class Human {
    let name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = 20
    }
}
var a = Human(name: "qkrtjddnjs", age: 25)
a.age // 20

class Man: Human {
    var address: String
    
    init(address: String) {
        self.address = address
        super.init(name: "kim", age: 25)
    }
}
var man = Man(address: "경기도")
man.name //kim




///편의 생성자
class Woman {
    let name: String
    let nicknName: String
    
    init(name: String, nickName: String) {
        self.name = name
        self.nicknName = nickName
    }
    
    convenience init(name: String) {
        self.init(name: name, nickName: "star")
    }
}

var woman = Woman(name: "park")
woman.nicknName // star

var woman1 = Woman(name: "kim", nickName: "moon")
woman1.nicknName //moon


///편의 생성자 2
class ListItem {
    var name: String
    var quantity: Int
    
    init(name: String, quantity: Int) {
        self.name = name
        self.quantity = quantity
    }
    
    convenience init(name: String) {
        self.init(name: name, quantity: 2)
        //편의 생성자에서 값을 설정하려면 다른 생성자를 먼저 부른 후 접근
        self.name = "a"
    }
}
var listItem = ListItem(name: "ab")
listItem.name //a
listItem.quantity //2

var good = ListItem(name: "abb", quantity: 3)
good.name //abb
good.quantity //3
