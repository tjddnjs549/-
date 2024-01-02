//: [Previous](@previous)

import Foundation


//클래스 내에서 인스턴스 메서드

class Counter {
    var count: Int = 0
    
    func plus(){
        count += 1
    }
    func plusAmount(by amount: Int){
        self.count += amount
    }
    func reset(){
        self.count = 0
    }
}

let counter = Counter()

counter.plus()
counter.count //1

counter.plusAmount(by: 5)
counter.count // 6

counter.reset()
counter.count // 0

//구조체에서 mutating메서드와 self
struct Point {
    var x: Double = 0.0
    var y: Double = 0.0
    
    func isToTheRightOf(x: Double) -> Bool {
        self.x > x
    }
    mutating func reset() {
        self = Point()
        print("reset. x ->", self.x)
    }
    mutating func plusOne() {
        x += 1 //mutating을 붙여서 자기 프로퍼티 값 변경
    }
    mutating func moveBy(x deltaX: Double, y deltaY: Double) -> String {
        self = Point(x: deltaX, y: deltaY) //프로퍼티의 속성값을 바꿈.
        return "\(self.x) , \(self.y)"
    }
}

var point = Point(x: 4.0)
if point.isToTheRightOf(x: 1.0) {
    print("This point is to the right of the line where x == 1.0")
} //This point is to the right of the line where x == 1.0

point.reset() // reset. x -> 0.0
point.plusOne() // x에 + 1을 함.
point.x // 1
point.moveBy(x: 5.0, y: 5.0) // 5.0 , 5.0


//enum에서의 Mutating 메서드와 self 할당
enum TriStateSwitch {
    case off, low, high
    
    mutating func next() {
        switch self {
        case .off :
            self = .low
        case .low :
            self = .high
        case .high :
            self = .off
        }
    }
}

var overLight = TriStateSwitch.low
overLight.next() //high


//타입 메서드
class SomeClass {
    
    static func someTypeMethod() {
        print ("Hi")
    }// static : 서브 클래스에서 오버라이딩을 할 수 없는 타입 메서드
     // class : 서브 클래스에서 오버라이딩을 할 수 있는 타입 메서드
}

SomeClass.someTypeMethod() // Hi

//구조체에서의 타입 메서드

struct LevelTracker {
    static var highestUnlockedLevel = 1
    var currentLevel = 1
    
    static func unlock(_ level: Int) { //static을 붙인 이유: highestUnlockedLevel이 타입 속성이라 타입 메서드로 해야 함.
        if level > highestUnlockedLevel {
            highestUnlockedLevel = level
        }
    }
    static func isUnlocked(_ level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }
    @discardableResult
    mutating func advance(to level: Int) -> Bool {
        if LevelTracker.isUnlocked(level) {// LevelTracker. 을 붙인 이유 : isUnlocked가 타입 메서드이기 때문에
            currentLevel = level
            return true
        } else {
            return false
        }
    }
}

var leveltracker = LevelTracker()
LevelTracker.unlock(5)
leveltracker.advance(to: 5) //true
