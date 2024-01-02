import Foundation

class Human {
    var name: String
    
    init(name: String) {
        self.name = "a"
        
    }
}

class Developer: Human {
    var language: String
    
    init(language: String) {
        self.language = language
        // !상위 클래스의 초기자보다 먼저 자신의 프로퍼티를 먼저 초기화해줘야 함!
        super.init(name: "Park")
        name = "ab"
        
    }
}

class Kim: Developer {
    var nickName: String
    
    init(nickName: String) {
        self.nickName = nickName
        // super.name = "aa" -> 불가능/ 아직 초기화 되지 않은 슈퍼클래스들의 프로퍼티에는 접근 불가능
        super.init(language: "swift")
        name = "abc"
    }
}

var kim = Kim(nickName: "star")
//Park
//swift
//star
Kim(nickName: "moon").name //abc


class A {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    convenience init(unknown: String) {
        self.init(name: unknown)
    }
}

class B: A {
    var nickName: String = "bigbig"
    var age: Int?
    
}

var b = B(name: "baebae")
b.name //baebae -> 이렇듯 부모클래스의 초기화를 상속받아서 쓸 수 있음
//만약 B클래스의 초기화가 있으면 부모클래스의 초기화는 상속되지 않음
var q = B(unknown: "sd")
q.name //sd





class C {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    convenience init(unknown: String) {
        self.init(name: unknown)
    }
}

class D: C {
    var nickName: String = "bigbig"
    var age: Int?
    
    override init(name: String) {
        //만약 부모클래스의 지정 생성자와 일치할려면 오버라이딩 해야함
        super.init(name: name) //당연히 지정 생성자차럼 super.init호출
    }
}
var d = D.init(unknown: "park")
d.name //park



///초기화 해제
class F {
    var name: String?
    deinit{
        print("end")
    }
}

class G: F {
    var nickName: String
    
    init(nickName: String) {
        self.nickName = nickName
    }
}
var g = G(nickName: "big")
g.name = "park"
print(g.name!) //park
var f: F? = F() //nil을 받아야 하기 때문에 ?옵셔널 키워드 붙임
f = nil //"end"가 출력
