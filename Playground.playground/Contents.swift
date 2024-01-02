// 구조체와 클래스

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

someVideoMode.name = "Dave"

if let name = someVideoMode.name  {
    print(name)
}
print(someVideoMode.name!, someVideoMode.frameRate)

let vga = Resolution(width: 640, height: 480)
print(vga.height, vga.width)

///lazy
class DataImporter {
  
  var filename = "data.txt"
}

class DataManager {
  lazy var importer = DataImporter()
    var data: [String] = []
}

let manager = DataManager()
manager.data.append("Some data")
manager.data.append("Some more data")

manager.importer.filename //data.txt -> importer 속성에 접근할 때만 인스턴스 생성
