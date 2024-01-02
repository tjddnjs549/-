import Foundation

class Vehicle { //부모 클래스
    var currentSpeed = 0.0
    var decription: String { //get 사용
        return "traveling at \(currentSpeed) miles per hour"
    }
    
    func makeNoise() {
        //statement
    }
}

class Bicycle: Vehicle { //자식 클래스
    var hasBasket = false
}

var bicycle = Bicycle()
bicycle.hasBasket = true
bicycle.currentSpeed = 15.0
print(bicycle.decription) //traveling at 15.0 miles per hour

class Tandem: Bicycle {
    var currentNumberOfPassengers = 0
}

let tandem = Tandem()
tandem.hasBasket = true
tandem.currentNumberOfPassengers = 2
tandem.currentSpeed = 22.0
print(tandem.decription) //traveling at 22.0 miles per hour

class Train: Vehicle {
    override func makeNoise() {
        print("Choo Choo")
    }
}
let train = Train()

train.makeNoise() //Choo Choo

class Car: Vehicle {
    var gear = 1
    override var decription: String {
        return super.decription + " in gear \(gear)"
    }
}

let car = Car()
car.currentSpeed = 25.0
car.gear = 3
print(car.decription) //traveling at 25.0 miles per hour in gear 3




class AutomaticCar: Car {

    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed / 10.0) + 1
        }
    }
}

let automaticCar = AutomaticCar()
automaticCar.currentSpeed = 35.0
print(automaticCar.decription) //Car의 계산 프로퍼티
//traveling at 25.0 miles per hour in gear 3
//traveling at 35.0 miles per hour in gear 4

final class Bus {
    
    var width: Int?
    var height: Int?
}

class Taxi {
    
    final var width: Int?
    
    final func distanceTime() {
        //statement
    }
}
