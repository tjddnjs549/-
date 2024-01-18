//: [Previous](@previous)

import Foundation




// MARK: - 문자열 다루기

///String.Index: 문자열에서 문자나 코드 유닛의 위치 (문자열의 인덱스를 표현하기 위해 사용하는 특수한 타입)

var a = "Hello,world"




// MARK: - prefix

//prefix(n): 앞에서부터 n글자 가져오기
print("테스트 - \(a.prefix(5))") //❗️인덱스 번호가 아닌 원소 위치(Int)
//테스트 - Hello




// MARK: - suffix

//suffix(n): 뒤에서부터 n글자 가져오기
print("테스트 - \(a.suffix(3))")
//테스트 - rld




// MARK: - append

//문자열에 문자 추가 하기 (❗️문자열도 배열이라 생각❗️)
a.append("s")
print("테스트 - \(a)")
//테스트 - Hello,worlds




// MARK: - startIndex, String.Index(encodedOffset: )

// startIndex , ⭐️String.Index(encodedOffset: 0)
// String.Index(encodedOffset: 0): 0번째 인덱스를 나타내는 인덱스 생성
print("테스트 - \(a[a.startIndex])")
//테스트 - H

a[String.Index(encodedOffset: 0)...String.Index(encodedOffset: a.count/2)]
//Hello,w




// MARK: - String.index(after: ), String.index(Substring.Index, offsetBy: Int)

var secondIndex = a.index(after: a.startIndex)
print("테스트 - \(a[secondIndex])")
//테스트 - e

//✅ func String.index(Substring.Index, offsetBy: Int) -> Substring.Index
//예를 들어 세 번째 글자 구하기의 경우 아래와 같이 offsetBy를 2 로 설정해 구한다

var index1 = a.index(a.startIndex, offsetBy: 3)
var index2 = a.index(a.endIndex, offsetBy: -2)

print("테스트 - \(a[...index1])") //테스트 - Hell
print("테스트 - \(a[index1...])") //테스트 - lo,worlds

print("테스트 - \(a[...index2])") //테스트 - Hello,world
print("테스트 - \(a[index2...])") //테스트 - ds



// MARK: - 문자열에서 특정 문자의 인덱스 구하기

//func firstIndex(of: Character) -> String.Index?
//func lastIndex(of: Character) -> String.Index?

var firstIndex = a.firstIndex(of: "o")
var lastIndex = a.lastIndex(of: "o")

if let firstIndex {
    print("테스트 - \(a[...firstIndex])")
    //테스트 - Hello
}
if let lastIndex {
    print("테스트 - \(a[...lastIndex])")
    //테스트 - Hello,wo
}


// MARK: - 문자열 안 요소들이 조건에 맞는지 안 맞는지 판단하기 -> allSatisfy()


// func allSatisfy(_ predicate: (Self.Element) throws -> Bool) rethrows -> Bool
// Returns a Boolean value indicating whether every element of a sequence satisfies a given predicate.


print("테스트 - \(a.allSatisfy { $0.isNumber })") // 테스트 - false

