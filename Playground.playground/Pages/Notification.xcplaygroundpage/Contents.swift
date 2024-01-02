//: [Previous](@previous)

import Foundation
// Notification Name 설정
extension Notification.Name {
    static let secret = Notification.Name("Shh")
}

// Notification과 관련된 인스턴스
enum NotificationKey {
    case password
}

class Master {
    func callPassword() {
        print("마스터: 벽면에 쓰여있는 암호를 읊어봐.")
        // NotificationCenter로 Post하기 (발송하기)
        NotificationCenter.default.post(name: Notification.Name.secret, object: nil, userInfo: [NotificationKey.password: "!@#$"])
    }
}

class Friend {
    let name: String
    
    init(name: String) {
        self.name = name
        // NotificationCenter에 Observer 등록하기
        NotificationCenter.default.addObserver(self, selector: #selector(answerToMaster(notification:)), name: Notification.Name.secret, object: nil)
    }
    @objc func answerToMaster(notification: Notification) {
        // notification.userInfo 값을 받아온다.
        guard let object = notification.userInfo?[NotificationKey.password] as? String else {
            return
        }
        print("\(name): 암호는 \(object)")
    }
}

let master = Master()

// 관찰자들 (observer)
let ariOwn = Friend(name: "아리랑")
let ariTwo = Friend(name: "쓰리랑")
let ariThree = Friend(name: "아라리오")

// observer들에게 일을 수행하라고 시킨다
master.callPassword()

//마스터: 벽면에 쓰여있는 암호를 읊어봐.
//아리랑: 암호는 !@#$
//쓰리랑: 암호는 !@#$
//아라리오: 암호는 !@#$
