
import Foundation

////이름을 붙인 함수
//func helloFunc() {
//    print("hello, world")
//}
//
////이름을 붙이지 않은 함수
//let helloClosure = {
//    print("hello, world")
//}
//
//helloFunc() //hello, world
//helloClosure() //hello, world
//
//
//
//// MARK: -  일급 객체
//
////❗️변수나 상수에 클로저를 대입 가능
//
//
//let closure = { () -> () in
//    print("Closure")
//}
//
//let closure2 = closure
//
//
////❗️함수의 파라미터 타입으로 클로저를 전달 가능
//
func doSomething(closure: () -> ()) {
    closure()
}
//
//doSomething(closure: { () -> () in
//    print("Hello!")
//}) // Hello!
//
//
////❗️함수의 리턴 타입으로 클로저를 전달 가능
//
//
//func something() -> () -> () {
//
//    return { () -> () in
//        print("Hello world!")
//    }
//}
//
//let ddw = something()
//ddw() //Hello world!



// MARK: - 클로저 실행하기

// ()을 초기화 후에 붙임
let closure = { () -> () in
    print("Closure")
}

closure() //Closure

// ()을 초기화 때 붙임
//let helloClosure = { () -> () in
//    print("Hello, Closure")
//}() //Hello, Closure

({ () -> () in
    print("Hello, name!")
})() //Hello, name!
    
    
    
func dSomething(closure: () -> ()) {
    closure()
}
    
dSomething { () -> () in
    print("Hello!")
} //
    
    
    
    
///클로저

func backWard(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}

var names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]


names.sorted(by: backWard) //내림차순
// ["Ewa", "Daniella", "Chris", "Barry", "Alex"]

//이것을 클로저로 하면..
let reversedNames = names.sorted(by: {(s1: String, s2: String) -> Bool in
    return s1 < s2
})//["Alex", "Barry", "Chris", "Daniella", "Ewa"]

//힘수 타입 생략 (return도 생략 가능)
let reversedName = names.sorted(by: {s1, s2 in return s1 > s2})
// ["Ewa", "Daniella", "Chris", "Barry", "Alex"]


//인자 이름도 줄일 수 있음
let reversName = names.sorted(by: {$0 < $1})
print(reversName) //["Alex", "Barry", "Chris", "Daniella", "Ewa"]
print(names) //["Chris", "Alex", "Ewa", "Barry", "Daniella"] 안바뀜
names.sorted(by: > ) // ["Ewa", "Daniella", "Chris", "Barry", "Alex"]
print(names) //["Chris", "Alex", "Ewa", "Barry", "Daniella"] 안바뀜
names.sort() //["Alex", "Barry", "Chris", "Daniella", "Ewa"] 바뀜

// 이렇듯 sorted()는 자기 자신은 바뀌지 않지만, 다른 변수에게 줄 때 그 변수에 정렬한 상태로 준다.
// sort()는 자기 자신이 바뀜



//후행클로저


let digitNames = [
  0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
  5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]

let numbers = [16, 58, 510]

let strings = numbers.map { (number) -> String in
  var number = number
  var output = ""
  repeat {
    output = digitNames[number % 10]! + output
    number /= 10
  } while number > 0
  return output
} //["OneSix", "FiveEight", "FiveOneZero"]


// 예제 -> 클로저 (후행 클로저가 아님.)
func sayHelloclosure (completion: (String) -> Void) {

    completion("Mike")
}

// 1
sayHelloclosure(completion: { (comment: String) in
        print("Hi,",comment)
})

// 2
sayHelloclosure(completion: { comment in
    print("Hi,",comment)
})

// 3
sayHelloclosure{ comment in
    
    print("Hi,",comment)
}

//4
sayHelloclosure{
    print("Hi,",$0)
}
//1
let helloPapa: (String) -> Void = {(s: String) -> Void in
    print("hi", s)
}
helloPapa("papa") //hi papa
//2
let helloMama: (String) -> Void = {(s) in // 매개변수 타입 생략
    print("hi", s)
}
helloMama("mama") //hi mama
//3
let helloSister: (String) -> Void = { //매개변수 생략
    print("hi", $0) //대신 $0 키워드 붙임
}
helloSister("sister") //hi sister



// MARK: - 고차함수 후행 클로저의 경량문법

var string = ["b", "r", "e", "a", "d"]
string.sort { $0 > $1 } //["r", "e", "d", "b", "a"]

var num = [1,2,3,4,5,6,7,8,9,10]
let num1 = num.filter { $0 % 2 != 0 } //[1, 3, 5, 7, 9]

let numb = [1, 2, 3, 4, 5]
let sum = numb.reduce(4) { $0 * $1 }
print(sum) //480


// MARK: - @escaping


func doDoSome (closure: () -> ()) {
    // 이건 non-escaping Closure
    // non-escaping Closure의 특징
    // 1) 함수내부에서 직접 실행하기 위해 사용, 파라미터로 받은 클로저를 변수나 상수에 대입 ❌
    // 2) 중첩 함수에서 클로저를 사용할 경우, 중첩함수를 리턴할 수 ❌
    // 3) 함수의 실행 흐름을 탈출하지 않아, 함수가 종료되기 전에 무조건 실행 되어야 한다 (즉, 함수가 끝난 후에 실행 ❌)
}


/// escaping Closure
func doSome (closure: @escaping () -> ()) {
    let _ : () -> () = closure
} // @escaping 안 붙이면 오류임 why? 첫번째에 해당/ 탈출(@escaping) 시켜줘서 사용 가능하게 함

func something (closure: @escaping () -> ()) {
    print("function start")
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
        closure() // 10초 뒤에 클로저 실행 -> 3번째에 해당/ 함수가 종료되기 전에 무조건 실행되야 하는데
        //탈출(@escaping)로 인해 오류 안됨
    }
    print("funtion end")
}

//결과
something { () -> () in
    print("closure!!!!!")
} //출력: function start 과 funtion end 이 같이 나옴  ❗️ 그리고 3초 뒤 closure!!!!! 가 나옴 -> 즉, escaping을 통해 함수에서 탈출시켜 클로저 실행



// MARK: - 캡쳐 값

func hasSomething() {
    
    var message = "Hello Something"
    
    var num = 1
    var closure = {() -> () in print(num)}()
    
    print(message)
}

hasSomething()
// 1
// Hello Something


// MARK: - 값 캡쳐는 무조건 참조 캡쳐임

func closureNum() {
    
    var num = 0
    
    print("#1 num: \(num)")
    
    let closure = { print("#2 num: \(num)") }
    
    num = 10
    print("#3 num: \(num)")
    closure()
}

closureNum()
// 출력
// #1 num: 0
// #3 num: 10
// #2 num: 10

func closureNums() {
    
    var num = 0
    print("#1 num: \(num)")
    
    let closure = {
        num = 20
        print("#2 num: \(num)")
    }
    
    closure()
    
    print("#3 num: \(num)")
}

closureNums()
// 출력
// #1 num: 0
// #2 num: 20
// #3 num: 20


func closureString() {
    
    var string = "hello"
    print("#1 string: \(string)")
    
    let closure = { [string] in
        print("#2 string: \(string)")
    }
    
    string = "Hello, world!"
    print("#3 string: \(string)")
    closure()
}

closureString()
// 출력
// #1 string: hello
// #3 string: Hello, world!
// #2 string: hello




// MARK: - 클로저의 강한 순환 참조

class Human {
    var name = "Jason"
    lazy var getName: () -> String? = { [weak self] in
        return self?.name
    }
    init() {
        print("인스턴스 생성")
    }

    deinit {
        print("인스턴스 소멸")
    }
}

var human: Human? = Human() // 인스턴스 생성
guard let getName = human!.getName() else { fatalError("ERROR") }
print(getName) // Jason
human = nil // 인스턴스 소멸

