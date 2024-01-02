
import Foundation


let char: Character = "A"

char is Character // true
char is String // false

let bool: Bool = true
bool is Bool // true
bool is Character // false

//class Person {}
//class Student: Person {}
//
//var student: Student = Student()
//student is Person //true -> 부모 클래스여도 참
//student is Student //true




//업캐스팅
class Human {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}
class Teacher: Human {}
class Student: Human {}

let people: [Human] = [Teacher.init(name: "김선생"),
                     Student.init(name: "박제자"),
                     Student.init(name: "이제자")]


for human in people {
    if human is Teacher {
        print("나는야 선생님 : \(human.name)")
    } else if human is Student {
        print("나는야 제자  : \(human.name)")
    }
}
//나는야 선생님 : 김선생
//나는야 제자  : 박제자
//나는야 제자  : 이제자


class A {
    var name: String = "a"
}
class B: A {
    var subject: String = "b"
}
class C: A {
    var title: String = "c"
}

var b = B.init() as A
b.name //  a
// b.subject -> 업캐스팅되어서 A 클래스에는 subject라는 프로퍼티가 없다

var bb = b as? B
bb?.subject // b
bb?.name // a



//Any / AnyObject


class D {
    var name: String = "d"

}
var things: [Any] = []

things.append(0)
things.append(0.0)
things.append(false)
things.append(3.14159)
things.append("hello")
things.append((3.0, 5.0))
things.append(print("Hi"))
things.append(D.init())
things.append({ (name: String) -> String in "Hello, \(name)" })


print(things) // [0, 0.0, false, 3.14159, "hello", (3.0, 5.0), __lldb_expr_190.D, (Function)]

// as를 이용한 패턴 매칭
for thing in things {
    switch thing {
    case _ as Int:
        print("Int Type!")
    case _ as Double:
        print("Double Type!")
    case _ as String:
        print("String Type!")
    case _ as D:
        print("D Type")
    case _ as (String) -> (String):
        print("Closure Type")
    default:
        print("something else")
    }
}
//Int Type!
//Double Type!
//something else
//Double Type!
//String Type!
//something else
//something else
//D Type
//Closure Type

var thing: [AnyObject] = []
thing.append(A.init())
thing.append(B.init())
thing.append(C.init())

