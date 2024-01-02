//: [Previous](@previous)

import Foundation

let waitingList: [String] = ["리이오", "폴", "존"]
waitingList.firstIndex(where:  {$0 == "리이오"}) //0
guard let waiting = waitingList.first else { fatalError("ERROR") }
print(waiting) // 리이오

// MARK: - if let / guard let

// 옵셔널 바인딩 할 때 둘의 차이점: nil




// MARK: - 예외 처리 (우리가 생각하지 못하는 케이스, 기대하지 않은 문제)
// 해줄 수 있는 방법은 많다. -> do~try, catch / Toast 띄우기 / alert창


enum TestError: Error {
    case devideToZero(rint: String)
    
    func name() -> String {
        switch self {
        case let .devideToZero(rint):
            return rint
        }
    }
}

func devide(_ number: Int) throws -> Int {
    let origin = 5
    
    guard number != 0 else {
        throw TestError.devideToZero(rint: "")
    }
    return origin / number
}

print(try devide(10)) // 0

do {
    try print(devide(0)) // 1
}catch TestError.devideToZero {
    print(TestError.devideToZero(rint: "분모가 0입니다.").name()) //분모가 0입니다.
}





