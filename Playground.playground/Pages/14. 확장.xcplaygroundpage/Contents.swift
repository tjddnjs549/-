import Foundation
// 예시
//extension SomeType {
//
//}
//extension SomeType: SomeProtocol, AnotherProtocol {
//    // 여기에 프로토콜 요구사항을 보완 구문 작성
//}

struct Point {
    var x: Int
    var y: Int
}

var point: Point = Point(x: 10, y: 10)
print("x: \(point.x) , y: \(point.y)") //x: 10 , y: 10

//이렇게 print하는 함수를 구현해야 하는 걸

extension Point {
    func printPoint() {
        print("x: \(self.x) , y: \(self.y)")
    }
}
point.printPoint() //x: 10 , y: 10


extension Int {
    var half: Int {
        return self / 2
    } // 계산 프로퍼티만 가능
    //var a: Int -> 확장 내에서 저장 프로퍼티는 안됨
    
    static func zero() {
        print("0 출력!")
    }
    func half1() -> Int {
        return self / 2
    }
    mutating func square() {
        self = self * self
    }
}

var int = 100
int.half //50

Int.zero() //0 출력!
int.half1() //50
int.square() //10000

// 클래스 확장 생성자 -> 클래스 확장에서는 편의 생성자밖에 못 쓴다
class A {
    var x: Int?
    var y: Int?
}

extension A {
    convenience init(a: Int?, b: Int?) {
        self.init() // 편의 생성자에서 값을 넣으려면 먼저 지정 생성자 호출 (1단계)
        self.x = a
        self.y = b
    } //2단계: 값 호출일 때
}

var a = A(a: 3, b: 4)
a.x // 3
a.y // 4


// 구조체 확장 생성자 -> 확장안에 생성자가 있다면 기본 생성자 사라지고, 없으면 자동으로 기본생성자 생성
struct PointStruct {
    let x: Int
    let y: Int
} // 확장안에 생성자가 없다면 자동으로 기본 생성자 생성
 
extension PointStruct {
    init(value: Int) {
        self.x = value
        self.y = value
    } // 이걸 씀으로써 기본생성자 사라짐
}

var pointStruct = PointStruct(value: 3)
pointStruct.x //3



extension String {
    subscript(idx: Int) -> String? {
        guard (0..<count).contains(idx) else {
            return nil
        }
        let target = index(startIndex, offsetBy: idx)
        return String(self[target])
    }
}

var hello: String = "Hello,world!"
hello[3] //l
hello[7] //o



// 확장에 중첩타입 추가하기

extension Int {
    enum Kind {
        case positive, zero, negative
    }
    var kind: Kind {
        switch self {
        case 0:
            return .zero
        case let x where x > 0:
            return .positive
        default:
            return .negative
        }
    }
}

var q: Int = 100
var w: Int = -100
var e: Int = 0
q.kind //positive
w.kind //negative
e.kind //zero

