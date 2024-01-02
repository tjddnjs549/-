import Foundation



// MARK: - protocol

// 상속 VS 프로토콜 : 상속은 상속/ 프로토콜은 채택
// 프로토콜은 약속 : 어떤 기능에 적합한 특정 메서드, 프로퍼티 및 기타 요구 사항의 청사진(계획)을 의미
// 프로토콜이 필요한 순간 : 설계도, 약속이 필요한 순간, 쓰면 좋은게 아니다, 때에 따라서는 걷어내야 하기도 합니다

protocol Lockable {
    
    func lockDoor()
    func openDoor()
}

class KiaCar: Lockable {
    
    func lockDoor() {
        
    }
    
    func openDoor() {
        
    }
}
//-----------------------------------------------------------------------------


protocol Vehicle {
    var engine: String { get }
}

protocol Movable {
    func go() -> Void
    func stop() -> Void
}


// struct Car: Identifiable, Vehicle, Movable {
struct Car: Vehicle, Movable {
    public var id: ObjectIdentifier // id 타입
    var engine: String {
        return "dd"
    }
    let name: String
    let color: Int
    
    func go() -> Void {}
    func stop() -> Void {}
}

//---------------------------------

protocol Loginable {
    
    func login() -> ()
}

struct Google: Loginable {
    func login() {
        logout()
    }
    
    func logout() {
        
    }
}

struct Meta: Loginable {
    func login() {
        
    }
}

struct Apple: Loginable {
    func login() {
        
    }
}


struct LoginManager {
    
    var apple = Apple()
    var google = google()
    
    let thirdParty: [Loginable] = [Apple(), Google(), Meta()]
    
    func sendRequestToSever() {
        thirdParty.first?.login()
        thirdParty[1].logout()
    }
}
