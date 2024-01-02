//: [Previous](@previous)

import Foundation

struct Name {
    
}

struct Person {
    
    private let name: Name? //에러가 나지 않는다 why? 옵셔널이라, 값이 없으면 nil로 설정
    
    
    
}

class StreetAddress {
    let number: String
    let street: String
    let unit: String?


    init(_ number: String, _ street: String, unit: String? = nil) {
        self.number = number
        self.street = street
        self.unit = unit
    }
}
extension StreetAddress: Equatable {
    static func == (lhs: StreetAddress, rhs: StreetAddress) -> Bool {
        return
            lhs.number == rhs.number &&
            lhs.street == rhs.street &&
            lhs.unit == rhs.unit
    }
}
let addresses = [StreetAddress("1490", "Grove Street"),
                 StreetAddress("2119", "Maple Avenue"),
                 StreetAddress("1400", "16th Street")]
let home = StreetAddress("1400", "16th Street")


print(addresses[0] == home)
// Prints "false"
print(addresses.contains(home))
// Prints "true"
