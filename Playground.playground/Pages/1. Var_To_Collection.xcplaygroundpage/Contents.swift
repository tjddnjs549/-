///let or var
import Foundation
let name = "mike"
var age = 12; print(age)


let personName : String = "jane"
var personAge : Int = 12
var red, green, blue : Double

var a = 3
var b: Double = 0.14159
var c = a + Int(b)




///any (다양한 타입)

var anyArray: [Any] = [12, 12.5 , "Hi", true]

var anyValue: Any = 1000
anyValue = "어떤 타입도 수용 가능"
anyValue = 1234.56

// let doubleValue: Double = anyValue
// error : any 타입에 double타입을 넣는 건 가능하지만 대입하는 건 안된다.





///typealias

typealias point = (x: Int, y: Int) // tuples

let p: point = (10, 20)
print(p) //x: 10, y: 20)




///[Tuples]

let http404Error = (404, "Not Found")
let (statusCode, statusMessage) = http404Error

print("The status code is \(statusCode)")
// "The status code is 404"
print("The status message is \(statusMessage)")
// "The status message is Not Found"

let (justTheStatusCode, _) = http404Error
print("The status code is \(justTheStatusCode)")
// "The status code is 404" 를 인쇄함

print("The status code is \(http404Error.0)")
// "The status code is 404" 를 인쇄함
print("The status message is \(http404Error.1)")
// "The status message is Not Found" 를 인쇄함

let http200Status = (statusCode: 200, description: "OK")

print("The status code is \(http200Status.statusCode)")
// "The status code is 200" 를 인쇄함
print("The status message is \(http200Status.description)")
// "The status message is OK" 를 인쇄함





/// Optionals / nil

var hello = "hello"
var hell = Int(hello) // nil

var serverResponseCode: Int? = 404
// serverResponseCode 는 404 라는 실제 Int 값을 담음
serverResponseCode = nil
// serverResponseCode 는 이제 아무 값도 담지 않음

var surveyAnswer: String? // nil
// surveyAnswer 에 자동으로 nil 을 설정합니다.





///If Statements and Forced Unwrapping (If 문과 강제 포장 풀기)

let possibleNumber = "123"
let convertedNumber = Int(possibleNumber) //123
print(convertedNumber) //Optional(123)

if (convertedNumber != nil) {
    print("convertedNumber has an integer value of \(convertedNumber!)")
    
} else {
    print("fail")
}   //convertedNumber has an integer value of 123




///Optional Binding (옵셔널 바인딩)

let myNumber = Int(possibleNumber)
if let myNumber { // (같은 말) let myNumber = myNumber
   print(myNumber)
}else {
    print("fail")
} // 123




///Implicitly Unwrapped Optionals (암시적으로 포장 푸는 옵셔널)

let possibleString: String? = "An optional string."
let forcedString: String = possibleString! // 느낌표를 요구함 -> 강제
print(forcedString) //An optional string.

let assumedString: String! = "An implicitly unwrapped optional string." // 약간 상수느낌 뺀 const (항상 값이 있음)
let implicitString: String = assumedString // 느낌표가 필요 없음
//An implicitly unwrapped optional string.




///Error Handling (에러 처리)

enum CustomError: Error {
    case insufficientFunds
}

func withdraw(amount: Int, balance: Int) throws -> Int {
    // throws: 에러가 생겨도 멈추지 않고 던지고, 안나면 정상적으로 실행하는 것
    guard amount <= balance else {
        throw CustomError.insufficientFunds
    }
    return balance - amount
}

do {
    let newBalance = try withdraw(amount: 500, balance: 300)
    print("Withdrawal successful. New balance is \(newBalance)") // 에러 없을 때 실행
} catch CustomError.insufficientFunds { /// [ insufficientFunds]의 case를 실행
    print("Insufficient funds")
} catch {
    print("An error occurred: \(error)")
}




/// Assentions and Preconditions -> 단언문 : 짧은 것들(변수선언)만으로도 디버깅하기.

let q = -3
//assert(q >= 0, "A person's age can't be less than zero.") <- 종료되서 일부러 주석처리.
// 이 단언문은 실패인데 -3 은 0 보다 크거나 같지 않기 (>=0) 때문에 프로그램 종료



///Enforcing Preconditions(선행 조건 강제하기) -> 반대로 조건문이나 함수등에 넣어서 사용 -> 참이면 함수 실행/ false이면 "~"실행하고 종료.
func divide(_ dividend: Int, by divisor: Int) -> Int {
    precondition(divisor != 0, "Divisor must not be zero.")
    return dividend / divisor
}

let result = divide(10, by: 2) // Valid: result is 5
//let invalidResult = divide(10, by: 0) -> 오류나서 주석처리함.
// Precondition failed: "Divisor must not be zero."




///문자열과 문자열

let manName = "mike"
let quotation = """
                hello , my name is mike i'm from korea\
                            bye!
                """// 띄어쓰기(tap)까지 다 나옴.
print(quotation) // 띄어쓰기 까지 다 나옴.

let threeMoreDoubleQuotationMarks = #"""
Here are three more double quotes: """
"""#
print(threeMoreDoubleQuotationMarks) //Here are three more double quotes: """

var emptyString = ""              // 빈 문자열 글자 값
var anotherEmptyString = String()   // 초기화 구문
// 이 두 문자열은 둘 다 비어 있으며, 서로 같은 겁니다.

if anotherEmptyString.isEmpty {
    print("empty")
} // empty




/// 문자열 색인

var variableString = "Horse"
variableString += " and carriage"

print(variableString) //Horse and carriage

variableString[variableString.startIndex] //H
variableString[variableString.index(before: variableString.endIndex)] //e
variableString[variableString.index(after: variableString.startIndex)] //o
let index = variableString.index(variableString.startIndex, offsetBy: 3)
variableString[index] //s

//for ind in variableString.indices {
//    print("\(variableString[ind])", terminator: " ")
//}




///문자열 집어넣기 및 삭제하기

var welcome: String = "hello"

welcome.insert(contentsOf: "!", at: welcome.endIndex)
print(welcome) // hello!

welcome.insert(contentsOf: " there", at: welcome.index(welcome.startIndex, offsetBy: 5))
print(welcome) // hello there!

welcome.remove(at: welcome.index(before: welcome.endIndex))
print(welcome) //hello there

let range = welcome.index( welcome.endIndex, offsetBy: -6)..<welcome.endIndex
welcome.removeSubrange(range)
print(welcome) // hello



///문자열 검사 -> 유니코드 달라도 같다고 나온다,

let quotation1: String = "we're a lot alike, you and I"
let sameQuotation: String = "we're a lot alike, you and I"

if (quotation1 == sameQuotation) {
    print("there two strings are connsidered equal")
} // there two strings are connsidered equal




/// 접두사와 접미사 비교

let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]

var act1SceneCount = 0
var mansionCount = 0
for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 1 ") {
        act1SceneCount += 1
    }
    if  scene.hasSuffix("Capulet's mansion"){
        mansionCount += 1
    }
}
print(act1SceneCount, mansionCount) // 5 6






///Arrays

var someInt: [Int] = []
print("someInts count is \(someInt.count)") //someInts count is 0

someInt.append(3)
print(someInt[0]) //3

var threeDoubles: [Double] = Array(repeating: 0.0, count: 3)
print(threeDoubles) //[0.0, 0.0, 0.0]

var antherThreeDoubles: [Double] = Array(repeating: 1.5, count: 3)
var sixDoubles: [Double] = threeDoubles + antherThreeDoubles
print(sixDoubles) // [0.0, 0.0, 0.0, 1.5, 1.5, 1.5]

var shoppingLists: [String] = ["Eggs","Milk"]
print("shoppingLists count is \(shoppingLists.count)") //someInts count is 2


// 배열 값 추가, 수정 및 제거
shoppingLists.append("Flours") // 마지막 인덱스에 추가
shoppingLists += ["Baking powder","Cheese"]
print(shoppingLists) // ["Eggs", "Milk", "Flours", "Baking powder", "Cheese"]

shoppingLists[3...4] = ["Bananas","Butter"]
print(shoppingLists) //["Eggs", "Milk", "Flours", "Bananas", "Butter"]

shoppingLists.insert("Syrup", at: 0)
//["Syrup", "Eggs", "Milk", "Flours", "Bananas", "Butter"]
//인덱스 0에 추가되면 원래 있던 값은 뒤로 밀려남.

shoppingLists[1] = "Six Eggs"
// ["Syrup", "Six Eggs", "Milk", "Flours", "Bananas", "Butter"]

shoppingLists.remove(at: 0) //Syrup이 제거됨.
shoppingLists.removeLast() //Butter가 제거됨
print(shoppingLists) //["Six Eggs", "Milk", "Flours", "Bananas"]

//배열 반복

for item in shoppingLists {
    print(item)
}

for (index, value) in shoppingLists.enumerated() {
    print("\(index + 1) : \(value)")
} //1 : Six Eggs 2 : Milk 3 : Flours 4 : Bananas




///sets

var letters: Set<String> = []
letters = ["Rock", "Classical", "Hip hop"]

letters.insert("Jazz")
print(letters) // ["Rock", "Classical", "Hip hop", "Jazz"]

letters.remove("Rock")
print(letters) // ["Hip hop", "Jazz", "Classical"]

if letters.contains("Jazz") {
    print("Jazz is in letters")
} // Jazz is in letters

for item in letters.sorted() {
    print(item)
} // Classical Hip hop Jazz

let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

oddDigits.union(evenDigits).sorted()
// [0, 1, 2, 3, 4, 5, 6, 7, 8, 9] -> 모두
oddDigits.intersection(evenDigits).sorted()
// [] -> 교집합
oddDigits.subtracting(singleDigitPrimeNumbers).sorted()
// [1, 9] -> (a - 교집합)
oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()
// [1, 2, 9] -> a와 b의 합집합 - a와 b의 교집합


let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]

houseAnimals.isSubset(of: farmAnimals)
// 참 -> a는 b의 자식이냐?
farmAnimals.isSuperset(of: houseAnimals)
// 참 -> b는 a의 부모냐?
farmAnimals.isDisjoint(with: cityAnimals)
// 참 -> 두 set이 공통된 값을 가지고 있지 않냐?






///딕셔너리

var nemesOfIntegers: [Int : String] = [:]
nemesOfIntegers[1] = "one" // 값 추가

var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
print(airports.count) // 2

airports["LHR"] = "London" // 값 추가
airports["LHR"] = "London Heathrow" // 값 수정

if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
  print("The old value for DUB was \(oldValue).")
} // The old value for DUB was Dublin. -> 바뀐 값말고 예전 값 출력


if let removedValue = airports.removeValue(forKey: "DUB") {
  print("The removed airport's name is \(removedValue).")
} else {
  print("The airports dictionary does not contain a value for DUB.")
} // The removed airport's name is Dublin Airport.

print(airports) //["LHR": "London Heathrow", "YYZ": "Toronto Pearson"]

for (airportCode, airportName) in airports {
    print("\(airportCode) : \(airportName)")
}

for airportCode1 in airports.keys {
    print("\(airportCode1)")
}
for airportName1 in airports.values {
    print("\(airportName1)")
}


var airportCodes = [String](airports.keys).sorted() //["YYZ", "LHR"]
var airportNames = [String](airports.values) //["London Heathrow", "Toronto Pearson"]

