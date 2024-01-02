import Foundation


// 문자열을 뒤집어도 타입이 문자열일 줄 알았지만 ReversedCollection<String>이다.
//func solution(_ my_string:String) -> String {
//
//       return my_string.reversed()
//}
var my_string = "bread12"

var string: [Character] = ["b", "r", "e", "a", "d"]
var int: [Int] = [1, 2, 3, 4, 5]
string.reverse()
//my_string.reverse() -> 오류 ? reverse()은 문자열 안됨
print(string) //["d", "a", "e", "r", "b"]
string.reversed() // ReversedCollection<String>
print(string) //["d", "a", "e", "r", "b"]
print(type(of: string.reversed())) // 리턴값: ReversedCollection<String>

int.reversed() //숫자는 reverse(), reversed() 둘 다 됨

//reverse() 는 배열을 뒤집는 것
//mutating func reverse()

//reversed() 는 문자열과 배열을 뒤집는 것
//func reversed() -> ReversedCollection<Self>
//string.sort()
//var asdd = string.sort()
//print(asdd) // ()
print(string) //["d", "a", "e", "r", "b"] 원래
var asd = string.sorted() //자기 자신은 안바뀌고
print(asd) // ["a", "b", "d", "e", "r"] asd만 바뀜
print(string) // ["d", "a", "e", "r", "b"] 안바뀜
//sort() -> 일반적으로 오름차순 (내림차순으로 하고 싶을 때 -> .sort( by: > )) /리턴값이 없음 -> 자신 자신만 바꿈
//sorted() -> 일반적으로 오름차순 (func sorted() -> [Self.Element]) 이렇듯 리턴값이 자기 자신-> 다른 변수한테 넘겨줄 수 있음
// (내림차순으로 하고 싶을 때 -> .sort( by: > ))


//map -> 기존의 컨테이너의 요소에 대해 정의한 클로저로 매핑한 결과를 새로운 결과로 리턴
//func map<T>(_ transform: (Self.Element) throws -> T) rethrows -> [T]
//$0 $1의 관계 -> 첫번째 인자, 두번째 인자 개념


//fiter -> 기존 컨테이너의 요소에 대해 조건에 만족하는 값에 대해서 새로운 컨테이너로 리턴 (true로 반환되는 값만 리턴)
//func filter(_ isIncluded: (Self.Element) throws -> Bool) rethrows -> [Self.Element]
var num = [1,2,3,4,5,6,7,8,9,10]
let num1 = num.filter { $0 % 2 != 0 }
print(type(of: num1)) //[1, 3, 5, 7, 9] //Array<Int>

var str = ["s","v","g"]
let str1 = str.filter { $0 == "s" || $0 == "v"}
print(type(of: str1)) //["s", "v"] //Array<String>

//문자열 필터링 하면 문자열 리턴
//func filter(_ isIncluded: (Self.Element) throws -> Bool) rethrows -> Self
var str2 = "23sd231"
var str3 = str2.filter {$0.isNumber}
print(type(of: str3)) //23231  // String


//reduce -> 정의한 클로저를 사용하여 기존 컨테이너의 요소를 결합한 결과를 리턴 / 데이터를 합쳐주기 위해 사용
// func reduce<Result>(_ initialResult: Result, _ nextPartialResult: (Result, Element) throws -> Result) rethrows -> Result
// reduce(초기값, 뭘할건지 연산자(생략 가능)) {클로저 정의}
let numbers = [1, 2, 3, 4, 5]
let sum = numbers.reduce(10, +)
print(sum) // 25

let numbers1 = [1, 2, 3, 4, 5]
let sum1 = numbers.reduce(4) { $0 * $1 }
print(sum1) //480
numbers1.first(where: {$0 == 1}) //1
//contains() : 배열에 요소가 포함되어 있는지 참/거짓으로 리턴
//func contains(_ element: Self.Element) -> Bool
numbers1.contains(2) //true
let plusNumbers = numbers1.map{$0 + 1}
print(plusNumbers)
//joined(): joined(separator: String = "") -> String 배열의 문자열들을 하나로 연결한 문자열로 반환 (문자열로 반환 중요!!!!!)
func solution(_ rsp: String) -> String {
    String(rsp.map { $0=="2" ? "0" : $0=="0" ? "5" : "2" }.joined())
}

var num3: [Int] = [1,2,3,3,4,5,6,6]
num3.count //8
num3.capacity //8
num3.first //1
guard let sdsd = num.first(where: {$0 == 3}) else { fatalError("ERROR")}
print(sdsd) //3


// 점 좌표 구하기
func solution(_ dot: [Int]) -> Int {
    dot[0] > 0 && dot[1] > 0 ?
    1 : dot[0] < 0 && dot[1] > 0 ?
    2 : dot[0] > 0 && dot[1] < 0 ?
    4 : 3
}
//스위치로 하면 (...) 연산자 활용
func solution1(_ dot:[Int]) -> Int {
    switch (dot[0], dot[1]) {
    case (0..., 0...): return 1
    case (...0, 0...): return 2
    case (...0, ...0): return 3
    case (0..., ...0): return 4
    default: return 0
    }
}
var numNil = [[1,2,4], [1,3], [nil,nil,6], [7]]
print(numNil.map {$0})//[[Optional(1), Optional(2), Optional(4)], [Optional(1), Optional(3)], [nil, nil, Optional(6)], [Optional(7)]]
print(numNil.flatMap{$0}) //[Optional(1), Optional(2), Optional(4), Optional(1), Optional(3), nil, nil, Optional(6), Optional(7)]
print(numNil.compactMap{$0}) //[[Optional(1), Optional(2), Optional(4)], [Optional(1), Optional(3)], [nil, nil, Optional(6)], [Optional(7)]]
var numNil1 = [1,nil,3,nil,5,nil,6]
print(numNil1.map{$0}) //[Optional(1), nil, Optional(3), nil, Optional(5), nil, Optional(6)]
print(numNil1.flatMap{$0}) //[1, 3, 5, 6]
print(numNil1.compactMap{$0}) //[1, 3, 5, 6]


//compactMap: nil을 없애주고 리턴
//func compactMap<ElementOfResult>(_ transform: (Self.Element) throws -> ElementOfResult?) rethrows -> [ElementOfResult]


//flapMap: 2차원 배열을 1차원으로 바꿔주고 nil없애주고 리턴


//isNumber  : A Boolean value indicating whether this character represents a number.
//var isNumber: Bool { get }

//문자열 정렬
func solution(_ my_string:String) -> [Int] {
    return my_string.filter { $0.isNumber }.map { Int(String($0))! }.sorted()
}
// 문자로 나온 건 문자열로 바꾸고 인트형으로 바꿔야 한다.
print(type(of: my_string.filter { $0.isNumber })) //String
print(my_string.filter { $0.isNumber } )//12


var ab = "asdsad"
for i in ab {
    print(type(of: i))
}


ab[ab.startIndex] // a
ab[ab.index(before: ab.endIndex)] //d
ab[ab.index(after: ab.startIndex)] // s
ab[ab.index(ab.startIndex, offsetBy: 2)] //d -> 인덱스 번호
//func index(_ i: String.Index, offsetBy distance: Int) -> String.Index


for ind in ab.indices {
    print("\(ab[ind])", terminator: " ")
} //a s d s a d




var numbers3: [Int] = [3, 2343, 6, 3432]

numbersLoop: for num in numbers3 {
    if num > 5 || num < 1{
    print("numbersLoop")
    continue numbersLoop
    }
    var count: Int = 0

    printLoop: while true {
        print(num) // 3개
        count += 1
    
        if count == num {
            break printLoop
        }
    }
    removeLoopL: while true {
        if numbers3.first != num{
            break numbersLoop
        }
        print(numbers3.removeFirst()) //3
    }
}

// MARK: - split / component

//Returns the longest possible subsequences of the collection, in order, around elements equal to the given element. (분리한다, 쪼갠다라고 생각)
// func split(separator: Self.Element, maxSplits: Int = Int.max, omittingEmptySubsequences: Bool = true) -> [Self.SubSequence]

let hello = "Hello, World. my name is Jason!"
hello.split(separator: " ") //["Hello,", "World.", "my", "name", "is", "Jason!"]
hello.split(separator: "l") //["He", "o, Wor", "d. my name is Jason!"]
hello.split(separator: " ", maxSplits: 1) //["Hello,", "World. my name is Jason!"]


//split이랑 비슷하지만 리턴 타입이 string 이다.
//func components<T>(separatedBy separator: T) -> [String] where T : StringProtocol
hello.components(separatedBy: "s") //["Hello, World. my name i", " Ja", "on!"]
hello.components(separatedBy: "") //["Hello, World. my name is Jason!"]
//split(separator: "") 이렇게 하면 각각 문자로 나온다.

