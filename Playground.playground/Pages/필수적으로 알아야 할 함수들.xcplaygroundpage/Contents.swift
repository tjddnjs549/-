

import Foundation



// MARK: - reduce (결합)

//설명: Returns the result of combining the elements of the sequence using the given closure.

var i = (0...10).filter {$0 % 2 == 0}.reduce(10, +) // (_1, _2) -> 1은 초기 결과값, 2는 연산자 +,-
print("테스트 - \(i)") // 40


let numbers = [1, 2, 3, 4]
let numberSum = numbers.reduce(0, { x, y in
    x + y
})
print("테스트 - \(numberSum)") // 10, 후행 클로저로도 사용 가능

