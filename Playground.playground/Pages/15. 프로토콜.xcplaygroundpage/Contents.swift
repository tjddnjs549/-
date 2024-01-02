import Foundation

protocol Band {
    var piano: String { get }
    func play(name: String)
}

class ABand: Band {}
class BBand: Band {}
struct CBand: Band {}
extension Band {
    var piano: String {
            return "piano"
        }
    func play(name: String) {
        print("\(name) Team 연주중..")
    }
}

ABand().play(name: "A") // A Team 연주중..
BBand().play(name: "B") // B Team 연주중..
CBand().play(name: "C") // C Team 연주중..

ABand().piano // piano


protocol Human { }

protocol Student {
    func study()
}

extension Student where Self: Human {
    func study() {
        print("공부 중..")
    }
}
class AStudent: Human, Student {}

class BStudent: Student {
    func study() {
        print("공부 중..")
    }
}

class CStudent: Student {
    func study() {
        print("공부 중..")
    }
}

AStudent().study() // 공부 중..


