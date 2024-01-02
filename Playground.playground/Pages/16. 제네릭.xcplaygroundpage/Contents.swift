import Foundation

func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
    let c = a
    a = b
    b = c
}
var firstString = "hello"
var secondString = "world"

print(firstString, secondString) //hello world
swap(&firstString, &secondString)
print(firstString, secondString) //world hello

var firstInt = 3
var secondInt = 5
print(firstInt, secondInt) //3 5
swapTwoValues(&firstInt, &secondInt)
print(firstInt, secondInt) //5 3

func swapTwoValue <One, Two>(a: One, b: Two) {}



//구조체, 클래스, 열거체에서 사용가능
struct Stack<Element> {
    var items: [Element] = []
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
}

var stack: Stack<Int> = Stack()



func isSameValues<T: Equatable> (_ a: T, _ b: T) -> Bool {
    return a == b //==연산자는 Equatable프로토콜을 준수할 때 사용가능
}

class Person {
}
class Student: Person {
}
class Lion {
}

func printName<T: Person>(a: T) {
    print("Person")
}

printName(a: Person()) //Person 출력
printName(a: Student()) //Person 출력
//printName(a: Lion()) -> 오류 ?<T: Person> 이란 제약을 걸어두어 Person클래스거나 Person클래스를 상속받은 클래스만 가능


//extension Array {
//    mutating func pop() -> Element {
//        return self.removeLast()
//    }
//}

extension Array where Element: FixedWidthInteger {
    mutating func pop() -> Element {
        return self.removeLast()
    }
}
var num = [1,2,3]
var str = ["a","b","c"]
num.pop() //3
//str.pop() 오류 ? FixedWidthInteger이란 제약을 걸어서 오류





