//: [Previous](@previous)

import Foundation


// To-Do 항목을 나타내는 구조체
struct TodoItem {
    var title: String
    var completed: Bool
}

// To-Do 항목 관리 클래스
class TodoList {
    var items: [TodoItem] = []
    
    // 클로저 프로퍼티: To-Do 항목이 변경될 때 호출됨
    var didUpdateItems: (() -> Void)?
    
    // To-Do 항목 추가 메서드
    func addItem(_ title: String) {
        let newItem = TodoItem(title: title, completed: false)
        items.append(newItem)
        didUpdateItems?()
    }
    
    // To-Do 항목 삭제 메서드
    func removeItem(at index: Int) {
        items.remove(at: index)
        didUpdateItems?()
    }
    
    // To-Do 항목 완료 상태 토글 메서드
    func toggleCompleted(at index: Int) {
        items[index].completed.toggle()
        didUpdateItems?()
    }
}

// To-Do 리스트 생성 및 데이터 핸들링 예제
let todoList = TodoList()

// To-Do 항목이 변경될 때 호출되는 클로저 설정
todoList.didUpdateItems = {
    print("To-Do 항목이 변경되었습니다:")
    for (index, item) in todoList.items.enumerated() {
        print("\(index + 1). \(item.title) - 완료: \(item.completed)")
    }
}

// To-Do 항목 추가
todoList.addItem("코딩 연습")
todoList.addItem("운동하기")
todoList.addItem("독서")

// To-Do 항목 완료 상태 변경
todoList.toggleCompleted(at: 0)

//// To-Do 항목 삭제
//todoList.removeItem(at: 1)
