//: [Previous](@previous)

import Combine
import Foundation

// 간단한 Publisher 생성
let publisher = Just("Hello, Combine!")

// Subscriber 생성
let subscriber = Subscribers.Sink<String, Never> { value in
    print(value)
}

// Publisher에 Subscriber 할당
let cancellable = publisher.subscribe(subscriber)



