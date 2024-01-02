import Foundation

///중첩된 타입 - class


class Person {
    
    enum Job {
        case jobLess, programmer, student
    }
    var job: Job = .jobLess
}

class Student: Person {
    enum School {
        case elementary, middle, high
    }
    var school: School
    
    init(school: School) {
        self.school = school
        super.init()
        super.job = .student
    }
}
//let personJob: Person.Job = .jobLess
//let studentJob: Student.Job = .student

let student: Student = Student(school: .middle)
student.job // student
student.school //middle


struct BlackjackCard {

    enum Suit: Character {
        case spades = "♠", hearts = "♡", diamonds = "♢", clubs = "♣"
    }
    enum Rank: Int {
        case two = 2, three, four, five, six, seven, eight, nine, ten
        case jack, queen, king, ace
        struct Values {
            let first: Int, second: Int?
        }
        var values: Values {
            switch self {
            case .ace:
                return Values(first: 1, second: 11)
            case .jack, .queen, .king:
                return Values(first: 10, second: nil)
            default:
                return Values(first: self.rawValue, second: nil)
            }
        }
    }
    let rank: Rank, suit: Suit
    var description: String {
        var output = "suit is \(suit.rawValue),"
        output += " value is \(rank.values.first)"
        if let second = rank.values.second {
            output += " or \(second)"
        }
        return output
    }
}
let theAceOfSpades = BlackjackCard(rank: .ace, suit: .spades)
print(theAceOfSpades)


func solution(_ num1:Int, _ num2:Int) -> Int {
    if num2 == 0 {
        print("Error")
    }
    return num1 / num2

}

let num3 = 10
let num4 = 5

solution(num3, num4)

let num5 = 7
let num6 = 2

solution(num5, num6)
