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

