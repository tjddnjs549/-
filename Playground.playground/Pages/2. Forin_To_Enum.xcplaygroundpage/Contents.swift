/// for-in
import Foundation
let name: [String] = ["Anna", "Alex", "Brain", "Jack"]

for names in name {
    print(names)
}//Anna \n Alex \n Brain \n Jack


let numberOfLegs: [String : Int] = ["spider": 8 , "ant" : 6 , "cat" : 4 ]

for (name, count) in numberOfLegs {
    print("\(name) have  \(count) legs")
}

let minute: Int = 60
let minutrInterval: Int = 5

for tickmark in stride(from: 0, to: minute, by: minutrInterval) {
    print(tickmark)
} // 5 10 15 20 ...55

for tickmark in stride(from: 0, through: minute, by: minutrInterval) {
    print(tickmark)
} // 5 10 15 20 ...60

let base: Int = 3
let power: Int = 10
var answer: Int = 1
for _ in 1...power {
    answer *= base
}
print(answer) // 59049








/// switch
let someCharacter: Character = "z"
switch someCharacter {
case "a":
  print("The first letter of the alphabet")
case "z":
  print("The last letter of the alphabet")
default:
  print("Some other character")
} //The last letter of the alphabet

let anotherPoint = (2, 0)
switch anotherPoint {
case (let x, 0):
  print("on the x-axis with an x value of \(x)")
case (0, let y):
  print("on the y-axis with a y value of \(y)")
case (0, _ ): //_ : 무시
  print("\(anotherPoint) is on the y-axis")
default : print("error")
} //on the x-axis with an x value of 2

let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
  print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
  print("(\(x), \(y)) is on the line x == -y")
case let (x, y):
  print("(\(x), \(y)) is just some arbitrary point")
} //(1, -1) is on the line x == -y






///제어 전달문
let puzzleInput = "great minds think alike"
var puzzleOutput = ""
let charactersToRemove: [Character] = ["a", "e", "i", "o", "u", " "]
for character in puzzleInput {
  if charactersToRemove.contains(character) {
    continue // 반복회차를 넘어가서 다음 반복 실행하게 함.
  }
  puzzleOutput.append(character)
}
print(puzzleOutput) // grtmndsthnklk



///함수

func greet(person: String) -> String {
    let greeting = "Hello, " + person + "!"
    return greeting
}
print(greet(person: "mike"))


//매개변수 (=파라미터) 없음
func sayHelloWorld() -> String {
    return "Hello, world"
}
print(sayHelloWorld()) //Hello, world



//매개변수 여러개
func greet(person: String, alreadyGreeted: Bool) -> String {
    if alreadyGreeted {
        return greet(person: person)
    }else {
        return sayHelloWorld()
    }
}

print(greet(person: "Tim", alreadyGreeted: true)) //Hello, Tim!



//리턴 없음
func greeting(person: String) {
    print("Hi, \(person)")
}
greeting(person: "Dave") //Hi, Dave


func printAndCount(string: String) -> Int {
    print(string)
    return string.count
}
func printWithoutCounting(string: String) {
    let _ = printAndCount(string: string) // 무시
}
 
printAndCount(string: "Hello, world") //Hello, world -> 12반환
printWithoutCounting(string: "Hello, world") //Hello, world



//리턴값이 여러개
func minMax (array: [Int]) -> (min: Int, max: Int)? {
    var currentMin = array[0]
    var currentMax = array[0]
    
    for value in array[1..<array.count] {
        if currentMin > value {
            currentMin = value
        }else if value > currentMax{
            currentMax = value
        }
    }
    return(currentMin, currentMax)
}

if let bounds = minMax(array: [8, -6, 2, 109, 3, 71]) {
    print(bounds.min , bounds.max) // -6 109
}



//함수 인자 이름표
func sayGreet (to person: String, from hometown: String) -> String {
    return ("\(person)! Glad you could visit from \(hometown)")
}
print(sayGreet(to: "Bill", from: "Cupertino"))
//Bill! Glad you could visit from Cupertino

func sayGreeting (_ person: String, _ hometown: String) -> String {
    return ("\(person)! Glad you could visit from \(hometown)")
}
print(sayGreeting("beef", "Cupertino"))
//beef! Glad you could visit from Cupertino

func sayHello (person: String = "Micky", from hometown: String) -> String {
    return ("\(person)! Glad you could visit from \(hometown)")
}
print(sayHello( from: "Cupertino"))
//Micky! Glad you could visit from Cupertino

func arithmeticMean (_ numbers: Double...) -> Double {
    var score: Double = 0.0
    for number in numbers {
        score += number
    }
    return score / Double(numbers.count)
}
arithmeticMean(3, 8.25, 18.75) // 10.0



//입-출력 매개변수
func swapValues(_ a: inout Int, _ b: inout Int) {
    let temp = a
    a = b
    b = temp
}

var x = 5
var y = 10

swapValues(&x, &y)
print("x =", x) // Output: x = 10
print("y =", y) // Output: y = 5



//매개 변수 타입으로 함수 타입, 변수에 함수 전달
func addTwoInts (_ a: Int, _ b: Int) -> Int {
    return a + b
}

let mathFunction: (Int, Int) -> Int = addTwoInts

mathFunction(3, 7) // 10


func printMathResult (_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int){
    print(mathFunction(a, b))
}

printMathResult(addTwoInts, 3, 7) //10



//반환 타입으로 함수 타입

func stepFoward(_ input: Int) -> Int {
    return input + 1
}
func stepBackward(_ input: Int) -> Int {
    return input - 1
}

func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    return backward ? stepBackward : stepFoward
}

var currentValue = 3
let moveNearerTozero = chooseStepFunction(backward: currentValue > 0)

while (currentValue != 0) {
    print(currentValue)
    currentValue = moveNearerTozero(currentValue)
} // 3 2 1







///클로저

func backWard(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

names.sorted(by: backWard) // ["Ewa", "Daniella", "Chris", "Barry", "Alex"]

//이것을 클로저로 하면..
let reversedNames = names.sorted(by: {(s1: String, s2: String) -> Bool in
    return s1 > s2
})//["Ewa", "Daniella", "Chris", "Barry", "Alex"]

//힘수 타입 생략 (return도 생략 가능)
let reversedName = names.sorted(by: {s1, s2 in return s1 > s2})
//["Ewa", "Daniella", "Chris", "Barry", "Alex"]


//인자 이름도 줄일 수 있음
let reversName = names.sorted(by: {$0 > $1})

names.sorted(by: > )


//후행클로저


let digitNames = [
  0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
  5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]

let numbers = [16, 58, 510]

let strings = numbers.map { (number) -> String in
  var number = number
  var output = ""
  repeat {
    output = digitNames[number % 10]! + output
    number /= 10
  } while number > 0
  return output
} //["OneSix", "FiveEight", "FiveOneZero"]


// 예제 -> 클로저 (후행 클로저가 아님.)
func sayHelloclosure (completion: (String) -> Void) {

    completion("Mike")
}

// 1
sayHelloclosure(completion: { (comment: String) in
        print("Hi,",comment)
})

// 2
sayHelloclosure(completion: { comment in
    print("Hi,",comment)
})

// 3
sayHelloclosure{ comment in
    
    print("Hi,",comment)
}

//4
sayHelloclosure{
    print("Hi,",$0)
}
//1
let a: (String) -> Void = {(s: String) -> Void in
    print("hi", s)
}
a("papa") //hi papa
//2
let ab: (String) -> Void = {(s) in
    print("hi", s)
}
ab("papa") //hi papa
//3
let abc: (String) -> Void = {
    print("hi", $0)
}
abc("papa") //hi papa


///열거체

enum Beverage: CaseIterable {
    case coffee, tea, juice
}
let numberOfChoices = Beverage.allCases.count
print("\(numberOfChoices) beverage") //3 beverage

for beverage in Beverage.allCases {
    print(beverage) // coffee  tea  juice
}
var asd = Beverage.coffee
print(asd) //coffee

//원시값
enum Grade: Int {
    case first // 0 자동으로 0이 들어감 / 만약 String이고 초기화를 안하면 자동으로 "first" 가 들어감
    case second // 자동으로 1이 들어감 / 만약 String이고 초기화를 안하면 자동으로 "second" 가 들어감
}
var yourGrade = Grade.first.rawValue // 0
var yourGrade1 = Grade.first
print(yourGrade1) //first


// 다른 열거체
enum SchoolDetail {
    case elementary(name: String)
    case middle(name: String)
    case high(name: String)
    
    func getName() -> String {
        switch self {
        case .middle(let name) :
            return name
        case let .high( name) :
            return name
        case .elementary(let name) :
            return name
        }
    }
}

let yourMiddleSchoolName = SchoolDetail.middle(name: "스위프트 중학교")
print(yourMiddleSchoolName) // middle(name: "스위프트 중학교")
let yourMiddleSchoolName1 = SchoolDetail.middle(name: "스위프트 중학교").getName()
print(yourMiddleSchoolName1) //스위프트 중학교



// MARK: - 퓨틀을 이용한 열거체

enum AppleProduct {
    case imac
    case ipad(model: String)
    case iphone(model: String, storage: Int)
    case macbook(model: String, storage: Int, size: Double)
    
    func getModel() -> String {
        switch self {
        case let .ipad(model) :
            return model
        case let .iphone(model, storage) :
            return model
        case let .macbook(model, storage, size) :
            return model
        default : return "ERROR"
        }
    }
}

let ipad: AppleProduct = .ipad(model: "Air4")
let iphone: AppleProduct = .iphone(model: "11pro", storage: 64)
let macbook: AppleProduct = .macbook(model: "M1pro", storage: 512, size: 14)

print(ipad.getModel()) //Air4
iphone.getModel()
