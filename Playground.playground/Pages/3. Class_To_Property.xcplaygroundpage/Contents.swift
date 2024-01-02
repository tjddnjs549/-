import Foundation
///구조체와 클래스

struct Resolution {
  var width = 0
  var height = 0
}
class VideoMode {
  var resolution = Resolution()
  var interlaced = false
  var frameRate = 0.0
  var name: String?
}

let someResolution = Resolution()
let someVideoMode = VideoMode()


//구조체와 열거체는 값 타입
let vga = Resolution(width: 640, height: 480)
var hd = vga

hd.width = 460

print(hd.width) // 460
print(vga.width) // 640 -> 다름 (복사해서 다른 공간 사용)


//클래스는 참조 타입


let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

print(tenEighty.frameRate) //25

let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0

print(tenEighty.frameRate) // 30 (25에서 30으로 바뀜, 같은 공간 사용)

if alsoTenEighty === tenEighty {
    print("같음")
} //같은 공간을 사용





//속성
struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}

var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)

rangeOfThreeItems.firstValue = 4

let rangeOfFourItems = FixedLengthRange(firstValue : 0, length: 4)
// 이 범위는 정수 값 0, 1, 2, 3 을 나타냄
//rangeOfFourItems.firstValue = 6
// 이는, firstValue 가 변수 속성일지라도, 에러를 보고할 것임

//lazy ->DataManager 클래스가 구조체가 되면 인스턴스를 상수로 해서 오류가 난다
struct DataImporter {
  
  var filename = "data.txt"
}

class DataManager {
  lazy var importer = DataImporter()
  var data: [String] = []
}

let manager = DataManager()
manager.data.append("Some data")
manager.data.append("Some more data")

manager.importer.filename //data.txt


//계산 속성
class Person{
    var name: String
    var yearOfBirth: Int
    
    init(name: String, yearOfBirth: Int) {
        self.name = name
        self.yearOfBirth = yearOfBirth
    }
    
    var age: Int { //읽기 전용 계산 속성
            let calendar = Calendar.current
            let now = Date()
            let year = calendar.component(.year, from: now)
            return year - yearOfBirth
    }
}

let p = Person(name: "이름", yearOfBirth: 2002)
p.age //21

// 계산 속성 2
struct Employee {
    let name: String
    var vacationAllocated: Int = 14
    var vacationTaken: Int = 0
    
    var vacationRemaining: Int {
        get {
            vacationAllocated - vacationTaken
        }
        set {
            vacationAllocated = vacationTaken + newValue
        }
    }
}

var archer = Employee(name: "Mike", vacationAllocated: 14)
archer.vacationTaken += 6
archer.vacationRemaining // 8 -> get을 실행해 vacationRemaining 값 설정 및 저장

archer.vacationRemaining = 6
archer.vacationAllocated // 12 -> set을 실행해 vacationAllocated(다른 속성) 값 설정 및 저장


///타입 속성
class Circle {
    static var pi: Double = 3.14
    //저장타입속성은 class 사용불가(재정의 불가능)
    
    
    static var multiPi: Double {
        // 상속 시 재정의가 필요하면(계산 속성 시) class 사용 /필요없으면 그대로 static
        get{
            return pi * 2
        }
    }
    var radius: Double
    
    init(radius: Double) {
        self.radius = radius
        Circle.pi //내부에서 type.property로 접근
    }
    
}

let circle = Circle(radius: 2.0)
circle.radius //2

Circle.pi //3.14 -> 외부에서 type.property로 접근
//circle.pi -> 인스턴스로 접근 불가능
Circle.multiPi // 6.28



///속성 감시자

var numberSetting: Int = 10 {
    
    willSet (newValue) {
        print("\(numberSetting) 이 \(newValue)로 바뀝니다.")
    }
    didSet (oldValue) {
        print("\(oldValue) 이 \(numberSetting)로 바뀌었습니다.")
    }
}

numberSetting = 20
//10 이 20로 바뀝니다.
//10 이 20로 바뀌었습니다.
