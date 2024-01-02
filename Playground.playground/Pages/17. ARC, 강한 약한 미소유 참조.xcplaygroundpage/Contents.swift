
import Foundation

//
////ARC 동작 원리
//class Person {
//    let name: String
//    init(name: String) {
//        self.name = name
//        print("\(name) is being initialized")
//    }
//    deinit {
//        print("\(name) is being deinitialized")
//    }
//}
//
//var reference1: Person?
//var reference2: Person?
//var reference3: Person?
//
//reference1 = Person(name: "John Appleseed")
//// Prints "John Appleseed is being initialized"
//
//reference2 = reference1
//reference3 = reference1
//
//reference1 = nil
//reference2 = nil
//
//
//reference3 = nil
////John Appleseed is being deinitialized
//
//
//
//
//
//
////강한 참조 사이클 -> 두 클래스의 프로퍼티의 상대 인스턴스를 생성해 참조하고 있는 경우 (! 이러면 ARC에서 자동으로 인스턴스를 메모리 x)
//
//class Person {
//    let name: String
//    init(name: String) { self.name = name }
//    var apartment: Apartment? //Apartment 타입 인스턴스 생성
//    deinit { print("\(name) is being deinitialized") }
//}
//
//class Apartment {
//    let unit: String
//    init(unit: String) { self.unit = unit }
//    var tenant: Person? //Person 타입 인스턴스 생성
//    deinit { print("Apartment \(unit) is being deinitialized") }
//}
//
//
//var john: Person? //인스턴스 생성 (초기값: nil)
//var unit4A: Apartment? //인스턴스 생성 (초기값: nil)
//
//john = Person(name: "John Appleseed")
//unit4A = Apartment(unit: "4A")
//
//
//john!.apartment = unit4A
//unit4A!.tenant = john // 서로를 참조하는 느낌 (각각 클래스의 인스턴스들은 참조 횟수가 2이다)
//
//john = nil
//unit4A = nil // 메모리 해제하기 위해 nil을 주지만 둘 사이에 연결은 유지 중 .. -> 이러면 메모리에서 할당 되지 않음!
//
//


// 강한 상호 참조를 해결을 위한 약한 참조
class Person {
    let name: String
    init(name: String) { self.name = name }
    var apartment: Apartment?
    deinit { print("\(name) is being deinitialized") }
}

class Apartment {
    let unit: String
    init(unit: String) { self.unit = unit }
    weak var tenant: Person? // 약한 참조
    deinit { print("Apartment \(unit) is being deinitialized") }
}
    
var john: Person?
var unit4A: Apartment?

john = Person(name: "John Appleseed")
unit4A = Apartment(unit: "4A")

john!.apartment = unit4A
unit4A!.tenant = john

john = nil
// Prints "John Appleseed is being deinitialized"
unit4A = nil
// Prints "Apartment 4A is being deinitialized"


//미소유 참조
class Customer {
    let name: String
    var card: CreditCard?
    init(name: String) {
        self.name = name
    }
    deinit { print("\(name) is being deinitialized") }
}

class CreditCard {
    let number: UInt64
    unowned let customer: Customer
    init(number: UInt64, customer: Customer) {
        self.number = number
        self.customer = customer
    }
    deinit { print("Card #\(number) is being deinitialized") }
}


var john1: Customer?

john1 = Customer(name: "John1 Appleseed")
john1!.card = CreditCard(number: 1234_5678_9012_3456, customer: john1!)

john1 = nil
// Prints "John1 Appleseed is being deinitialized"
// Prints "Card #1234567890123456 is being deinitialized"
