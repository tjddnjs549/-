//: [Previous](@previous)

import Foundation

// 1. 열거체는 클래스와 스트럭트 안에 넣어야 정석이다
struct Student {
    
    enum Car {
        case SUV
        case small
        case etc(String)
    }
    
    let name: String = "비버"
    let car: Car? = .etc("비버")
}

// 2. 타입 메서드와 타입 프로퍼티

// 3. custom init 사용

// 4. 확장을 이용한 enum

