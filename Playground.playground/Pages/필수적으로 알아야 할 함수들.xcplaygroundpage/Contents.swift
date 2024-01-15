import Foundation




// MARK: - reduce (결합)

///설명: Returns the result of combining the elements of the sequence using the given closure.

var i = (0...10).filter {$0 % 2 == 0}.reduce(10, +) // (_1, _2) -> 1은 초기 결과값, 2는 연산자 +,-
print("테스트 - \(i)") // 40


let reduceNum = [1, 2, 3, 4]
let numberSum = reduceNum.reduce(0, { x, y in
    x + y
})
print("테스트 - \(numberSum)") // 10, 후행 클로저로도 사용 가능







// MARK: - contains()

/// 설명: Returns a Boolean value indicating whether the sequence contains the given element.
/// func contains(_ element: Self.Element) -> Bool

let containsNumber = [1, 2, 3, 4, 5]
let containsStr = "ab6CDE443fgh22iJKlmn1o"

if containsStr.contains("6CD") {
    print("The array contains 3.")
} else {
    print("The array does not contain 3.")
}







// MARK: - filter {} (필터링)

/// 설명: 기존 컨테이너의 요소에 대해 조건에 만족하는 값에 대해서 새로운 컨테이너로 리턴 (true로 반환되는 값만 리턴)
/// func filter(_ isIncluded: (Self.Element) throws -> Bool) rethrows -> [Self.Element]

var filterNum = [1,2,3,4,5,6,7,8,9,10]
let filterNumber = filterNum.filter { $0 % 2 != 0 }
print(type(of: filterNumber)) //[1, 3, 5, 7, 9] //Array<Int>


var filterStr = ["s","v","g"]
let filterStr1 = filterStr.filter { $0 == "s" || $0 == "v"}
print(type(of: filterStr1)) //["s", "v"] //Array<String>


/// ⭐️문자열 필터링 하면 문자열 리턴
/// func filter(_ isIncluded: (Self.Element) throws -> Bool) rethrows -> Self
var filterStr2 = "23sd231"
var filterStr3 = filterStr2.filter {$0.isNumber}
print(type(of: filterStr3)) //23231  // String






// MARK: - map {} (매핑)

/// 설명: 기존의 컨테이너의 요소에 대해 정의한 클로저로 매핑한 결과를 새로운 결과로 리턴
/// func map<T>(_ transform: (Self.Element) throws -> T) rethrows -> [T]
/// $0 $1의 관계 -> 첫번째 인자, 두번째 인자 개념


let mapNumber = [1, 2, 3, 4, 5]
let mapNumbers = mapNumber.map { $0 * 2 }
print(mapNumbers) // [2, 4, 6, 8, 10]

let mapStr = "1234"
print("테스트 - \(mapStr.map {Int(String($0))!}.reduce(0 , +))")
//Int(String($0))! 이 부분 char -> String -> Int 로 바꿈 (문자열의 map을 적용하면 문자로 매핑 변환)





// MARK: - compactMap {}

/// 설명: Returns an array containing the non-nil results of calling the given transformation with each element of this sequence.
/// func compactMap<ElementOfResult>(_ transform: (Self.Element) throws -> ElementOfResult?) rethrows -> [ElementOfResult]

let compactMapNum = ["1", "2", "three", "4", "//5//"]


let compactMapNumToMap = compactMapNum.map { Int($0) }
print("테스트 - \(compactMapNumToMap)") // [Optional(1), Optional(2), nil, Optional(4), nil]

let compactMapNumbers = compactMapNum.compactMap { Int($0) }
print("테스트 - \(compactMapNumbers)") // [1, 2, 4]





// MARK: - reverse (뒤집기)

/// reverse설명: Reverses the elements of the collection in place.
/// 반환 값이 없음

var reverseChar: [Character] = ["C", "a", "f", "é"]
reverseChar.reverse()
print(reverseChar)// ["é", "f", "a", "C"]






// MARK: - reversed (뒤집기)

/// @inlinable public func reversed() -> ReversedCollection<String>
/// 설명: Returns a view presenting the elements of the collection in reverse order.
/// 반환 값 있음

var reversedStr = "bread12"
var reversedStr1 = reversedStr.reversed()
print(Array(reversedStr1))

let reversedword = "Backwards"
for char in reversedword.reversed() {
    print(char, terminator: "")
} // Prints "sdrawkcaB"






// MARK: - sort (정렬)

/// 설명: sort는 Comparable을 만족하는 Element를 정렬하는 인스턴스 메서드
/// 리턴값 없음



var sortNums: [Int] = [7, 6, 9, 2, 4, 5, 1, 8, 3]
var sortNames: [String] = ["break", "fast", "car", "apple", "drive", "ensure", "gear"]


sortNums.sort() // [1, 2, 3, 4, 5, 6, 7, 8, 9]
sortNames.sort() // ["apple", "break", "car", "drive", "ensure", "fast", "gear"]

print(sortNums) // [1, 2, 3, 4, 5, 6, 7, 8, 9]
print(sortNames) // ["apple", "break", "car", "drive", "ensure", "fast", "gear"]

sortNums.sort(by: >)
sortNames.sort(by: >)

print(sortNums)
print(sortNames)





// MARK: - sorted (정렬)

/// 설명: sort는 Comparable을 만족하는 Element를 정렬하는 인스턴스 메서드
/// 리턴값 있음



var sortedNums: [Int] = [7, 6, 9, 2, 4, 5, 1, 8, 3]

var sortedNumber = sortedNums.sorted { lhs, rhs in
  lhs > rhs
}

print(sortedNumber) // [9, 8, 7, 6, 5, 4, 3, 2, 1]




// MARK: - pow()함수 , sqrt 제곱근 함수

/// 설명: 제곱을 구할 때 사용
/// func pow(_: Double, _: Double) -> Double

let powValue = 3.0
pow(powValue, 2) // 9.0


/// 설명: 제곱근 구할 때 사용
/// func sqrt(_: Double) -> Double

let sqrtValue = 9.0
sqrt(sqrtValue) // 3.0




// MARK: - uppercased(), lowercased() (대소문자)


/// 설명: 대소문자로 변환해주는 함수
/// upperCased/lowerCased 아님 (C -> 대문자 ❌)



let caseStr = "Hello Swift"
caseStr.uppercased() // "HELLO SWIFT"
caseStr.lowercased() // "hello swift"

let caseStr1 = "안녕123!"
caseStr1.uppercased() // "안녕123!"
caseStr1.lowercased() // "안녕123!"




// MARK: - components(separatedBy: )

/// func components<T>(separatedBy separator: T) -> [String] where T : StringProtocol
/// 설명:Returns an array containing substrings from the string that have been divided by the given separator.



var componentsString = "I love You"
var separatedByString = componentsString.components(separatedBy: " ")
print(separatedByString)

var componentStr = "pPoooyY"

print("테스트 - \(componentStr.lowercased().components(separatedBy: "p"))")
//테스트 - ["", "", "oooyy"]
print("테스트 - \(componentStr.lowercased().components(separatedBy: "y"))")
//테스트 - ["ppooo", "", ""]





// MARK: - joined(separator: )



/// 설명: Returns the concatenated elements of this sequence of sequences, inserting the given separator between each element.
/// 문자열 (String)만 가능.

var joinedString = "12345"

// 중간에 " "을 넣어 문자열로 만들기
//func joined(separator: String = "") -> String
let joinedArr = ["i", "am", "king", "!"]
print(joinedArr.joined(separator: " ")) //i am king !


///2차원 배열에 0을 넣어 1차원 배열으로 만들기
///func joined<Separator>(separator: Separator) -> JoinedSequence<Self> where Separator : Sequence, Separator.Element == Self.Element.Element
let joinedArr2 = [[1], [3], [5], [7]]
let joined = joinedArr2.joined(separator: [0])
print(Array(joined))
// [1, 0, 3, 0, 5, 0, 7]


///func joined() -> FlattenSequence<Self>
let joinedranges = [0..<3, 3..<6, 6..<10]
// joined를 사용하면 각각의 범위에 접근할 수 있음
for index in joinedranges.joined() {
    print(index, terminator: " ")
}
// 0 1 2 3 4 5 6 7 8 9






// MARK: - 


