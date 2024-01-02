import Foundation


let sodeul: String = "hello, world"
extension String {
    subscript(idx: Int) -> String? {
            guard (0..<count).contains(idx) else {
                return nil
            }
            let target = index(startIndex, offsetBy: idx)
            return String(self[target])
        }
    }

sodeul[0] //h
print(sodeul[0]!) //Optional("h")


//sodeul[0] -> 오류


struct Array {
    let array: [Int] = [1,2,3]
    subscript(index: Int) -> Int {
        return array[index]
    }
}
let arr = Array()
print(arr[2]) //3




struct MyArray {
    var array: [Int]

    subscript(index: Int) -> Int {
        get {
            return array[index]
        }
        set(newValue) {
            array[index] = newValue
        }
    }
}

// Usage
var myArray = MyArray(array: [1, 2, 3, 4])
print(myArray.array[2]) // Output: 3

myArray.array[1] = 5
print(myArray.array[1]) // Output: 5


struct Stack {
    static let stack: [Int] = [1, 2, 3, 4]
    
    static subscript (index: Int) -> Int {
        return Stack.stack[index]
    }
}

Stack[1] //2 타입 이름에 대고 호출이 가능




var list: [[String:String]] = [
        ["name":"1번방","date":"2박","price":"200000원"],
        ["name":"2번방","date":"1박","price":"500000원"],
        ["name":"3번방","date":"1박","price":"400000원"],
        ["name":"4번방","date":"1박","price":"700000원"]
    ]

var list1 = list.sorted{$0["price"]!<$1["price"]!}

print(list1)

print(list[0]["price"]!, list[1]["price"]!, list[2]["price"]!,
      list[3]["price"]!)
