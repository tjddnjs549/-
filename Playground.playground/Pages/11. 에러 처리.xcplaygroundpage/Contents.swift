import Foundation

struct Test {
    enum HttpError: Error {
        case badRequest
        case unauthorized
        case notFound(_ errorPrint: String)
        case conflict
    }
    
    
//    func printNumber(number: Int) throws {}
//    func printNumber(number: Int) throws -> Int {}
    func printNumber(number: Int) throws -> Bool {
        let text: String = "숫자 출력"
        guard number > 0 else {
            throw HttpError.notFound("not found.")
        }; print("\(text): \(number)")
        return true
    }
}

var test = Test()
try? test.printNumber(number: 1)


do {
    try? test.printNumber(number: -1)
    } catch Test.HttpError.notFound("not found.") {
    print("숫자를 다시 입력해주세요")
    } catch Test.HttpError.conflict {
    print("숫자를 다시 입력해주세요")
    } catch Test.HttpError.badRequest {
    print("숫자를 다시 입력해주세요")
    }
