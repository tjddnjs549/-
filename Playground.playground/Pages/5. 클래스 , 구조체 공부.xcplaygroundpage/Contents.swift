//: [Previous](@previous)

import Foundation

struct Person {
    
    let name: String = "박성원"
    var age: Int
    var address: String
    
    
    mutating func plus() {
        self.age += 1
    }
    
    mutating func death() {
        self.age = 0
    }
}

var person = Person(age: 26, address: "경기도") //참조 타입 (2-1) / 값 타입 (2-2)
person.age
person.name
person.address

person.plus()
person.age
person.death()
person.age

//구조체 : 초기자 자동으로 생성 -> 인스턴트 생성 시 변수는 다 써주고, 상수같은 건 초기화했으면 안 써도 됨. / 값 타입(2-2) -> 그래서 인스턴트 생성 시 상수로 하면
//프로퍼티의 변수가 있는 경우 오류가 남 / mutating: 프로퍼티 값 변경하는 메서드에 붙임.
//클래스 : 초기자 자동으로 생성하지 않음. -> 초기화 해줘야 함. / 참조 타입(2-1)
