import Foundation

struct Contact {
    var email: String
    var address: [String : String]
}

struct Person {
    var name: String
    var contact: Contact
    
    init(name: String, email: String, address: String) {
        self.name = name
        contact = Contact(email: email, address: ["Home" : address])
    }
    
    func getContact() -> Contact? {
        return contact
    }
}


var person: Person? = Person(name: "Kim",
                           email: "asd@gmail.com",
                           address: "goyang")

//person.getContact()?.email //asd@gmail.com

let email = person?.getContact
email?()?.email //asd@gmail.com

//person = nil
//let email = person?.contact?.email //nil

print(type(of: email)) //Optional<String>


var dic: [String:String]? = ["name":"Kim"]
// dic["name"].count -> 오류
dic?["name"]?.count //3
