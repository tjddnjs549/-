
import Foundation

func doDoSome (closure: () -> ()) {
    closure()
    // 이건 non-escaping Closure: 함수가 끝나기 전 (파라미터인) 클로저가 실행하는 것
    
    // non-escaping Closure의 특징
    
    // 1) 함수 내부에서 직접 실행하기 위해 사용하고,
    //    파라미터로 받은 클로저를 변수나 상수에 대입 ❌ -> 하려고 @escaping 쓰는 것
    
    // 2) 중첩 함수에서 클로저를 사용할 경우, 중첩함수를 리턴할 수 ❌
    
    // 3) 함수의 실행 흐름을 탈출하지 않아, 함수가 종료되기 전에 무조건 실행 되어야 한다.
    //    (즉, 함수가 끝난 후에 실행 ❌)
}

class Asd {

    var completion: () -> () //프로퍼티 속성 타입: 클로저
    
    // non-escaping Closure: 파라미터로 받은 클로저를 변수나 상수에 대입 ❌ -> 하려고 @escaping 쓰는 것
    init(completion: @escaping () -> ()) {
        // @escaping을 쓰는 이유: 파라미터completion을 self.completion에 대입해주기 위해 씀
        self.completion = completion
        // 파라미터로 받은 클로저를 변수나 상수에 대입하기 위해 "@escaping" 키워드를 쓴다
    }
    
    func doSome (name: @escaping () -> ()) {
        self.completion = name
    }
}

var asd = Asd(completion: {})

asd.doSome(name: { () -> () in
    print("성원") //name 이란 클로저를 선언만함 실행 절대xxxxs
})

asd.completion()


