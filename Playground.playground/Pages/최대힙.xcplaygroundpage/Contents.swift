////: [Previous](@previous)

import Foundation

struct MaxHeap<Element: Comparable> { //제네릭

    var elements: [Element] = [] //Element타입의 elements라는 이름의 배열 변수

    var isEmpty: Bool {//get

        return elements.isEmpty // 비어있으면 참, 비어있지 않으면 불
    }
    var count: Int {//get

        return elements.count // 요소의 개수를 리턴
    }

    //원소 삽입 (mutating을 붙인 이유: 속성의 값이 바뀌는 함수면 구조체에서는 메서드 앞에 mutating를 붙임)
    mutating func insert(_ element: Element) {
        elements.append(element) //파라미터를 추가
        siftUp(from: elements.count - 1)
    }
    //mutating을 붙인 이유: 속성의 값이 바뀌는 함수면 구조체에서는 메서드 앞에 mutating를 붙임
    mutating func siftUp(from index: Int) {
        var child = index// 파라미터를 child에 넣음
        var parent = parentIndex(of: child)

        while child > 0 && elements[child] > elements[parent] {
            elements.swapAt(child, parent)
            child = parent
            parent = parentIndex(of: child)
        }
    }
    //mutating을 붙인 이유: 속성의 값이 바뀌는 함수면 구조체에서는 메서드 앞에 mutating를 붙임
    mutating func pop() -> Element? {
        guard !isEmpty else {
            return nil
        }

        elements.swapAt(0, count - 1)
        let element = elements.removeLast()
        siftDown(from: 0)
        return element
    }
    //mutating을 붙인 이유: 속성의 값이 바뀌는 함수면 구조체에서는 메서드 앞에 mutating를 붙임
    mutating func siftDown(from index: Int) {
        var parent = index

        while true {
            let leftChild = leftChildIndex(of: parent)
            let rightChild = rightChildIndex(of: parent)
            var candidate = parent

            if leftChild < count && elements[leftChild] > elements[candidate] {
                candidate = leftChild
            }

            if rightChild < count && elements[rightChild] > elements[candidate] {
                candidate = rightChild
            }

            if candidate == parent {
                return
            }

            elements.swapAt(parent, candidate)
            parent = candidate
        }
    }

    func parentIndex(of index: Int) -> Int { //index
        return (index - 1) / 2
    }

    func leftChildIndex(of index: Int) -> Int {
        return index * 2 + 1
    }

    func rightChildIndex(of index: Int) -> Int {
        return index * 2 + 2
    }
}

var maxHeap = MaxHeap.init(elements: [5,6]) // 값 있게 초기화
print(maxHeap)
maxHeap.insert(10)
print(maxHeap)
maxHeap.insert(7)
print(maxHeap)
maxHeap.insert(8)
print(maxHeap)
maxHeap.insert(3)
print(maxHeap)
maxHeap.insert(4)
print(maxHeap)
maxHeap.insert(1)
print(maxHeap)
maxHeap.insert(2)
print(maxHeap)
maxHeap.insert(10)
print(maxHeap)
maxHeap.insert(9)
print(maxHeap)
maxHeap.pop()
print(maxHeap)

print("@@@@@@@@@@@@")
maxHeap.elements.forEach{ item in
    print(maxHeap.parentIndex(of: item))
}
print("@@@@@@@@@@@@")
maxHeap.elements.forEach{ item in
    print(maxHeap.rightChildIndex(of: item))
}
print("@@@@@@@@@@@@")
maxHeap.elements.forEach{ item in
    print(maxHeap.leftChildIndex(of: item))
}

print("\(Int(7 / 2))") // 3

//struct MaxHeap<T: Comparable> {
//    var heap: Array<T> = []
//    var isEmpty: Bool {
//        return heap.count <= 1 ? true : false
//    }
//
//    init() { }
//    init(_ data: T) {
//        heap.append(data)       // 0번 index 채우기용
//        heap.append(data)       // 실제 Root Node 채우기
//    }
//
//    mutating func insert(_ data: T) {
//        if heap.isEmpty {
//            heap.append(data)
//            heap.append(data)
//            return
//        }
//        heap.append(data)
//
//        func isMoveUp(_ insertIndex: Int) -> Bool {
//            if insertIndex <= 1 {               // 루트 노드일 때
//                return false
//            }
//            let parentIndex: Int = insertIndex / 2
//            return heap[insertIndex] > heap[parentIndex] ? true : false
//        }
//
//        var insertIndex: Int = heap.count - 1
//        while isMoveUp(insertIndex) {
//            let parentIndex: Int = insertIndex / 2
//            heap.swapAt(insertIndex, parentIndex)
//            insertIndex = parentIndex
//        }
//    }
//
//    enum moveDownStatus { case left, right, none }
//
//    mutating func pop() -> T? {
//        if heap.count <= 1 { return nil }
//
//        let returnData = heap[1]
//        heap.swapAt(1, heap.count - 1)
//        heap.removeLast()
//
//        func moveDown(_ poppedIndex: Int) -> moveDownStatus {
//            let leftChildIndex = (poppedIndex * 2)
//            let rightCildIndex = leftChildIndex + 1
//
//            // case1. 모든(왼쪽) 자식 노드가 없는 경우 (완전이진트리는 왼쪽부터 채워지므로)
//            if leftChildIndex >= (heap.count) {
//                return .none
//            }
//
//            // case2. 왼쪽 자식 노드만 있는 경우
//            if rightCildIndex >= (heap.count) {
//                return heap[leftChildIndex] > heap[poppedIndex] ? .left : .none
//            }
//
//            // case3. 왼쪽 & 오른쪽 자식 노드 모두 있는 경우
//            // case 3-1. 자식들이 자신보다 모두 작은 경우
//            if (heap[leftChildIndex] < heap[poppedIndex]) && (heap[rightCildIndex] < heap[poppedIndex]) {
//                return .none
//            }
//
//            // case 3-2. 자식들이 자신보다 모두 큰 경우 (왼쪽과 오른쪽 자식 중 더 큰 자식 선별)
//            if (heap[leftChildIndex] > heap[poppedIndex]) && (heap[rightCildIndex] > heap[poppedIndex]) {
//                return heap[leftChildIndex] > heap[rightCildIndex] ? .left : .right
//            }
//
//            // case 3-3. 왼쪽 & 오른쪽 중 한 자식만 자신보다 큰 경우
//            return heap[leftChildIndex] > heap[poppedIndex] ? .left : .right
//        }
//
//        var poppedIndex = 1
//        while true {
//            switch moveDown(poppedIndex) {
//            case .none:
//                return returnData
//            case .left:
//                let leftChildIndex = poppedIndex * 2
//                heap.swapAt(poppedIndex, leftChildIndex)
//                poppedIndex = leftChildIndex
//            case .right:
//                let rightChildIndex = (poppedIndex * 2) + 1
//                heap.swapAt(poppedIndex, rightChildIndex)
//                poppedIndex = rightChildIndex
//
//            }
//        }
//    }
//}
//var heap = Heap.init(data: 50)
//heap.insert(100)
//heap.insert(30)
//heap.insert(10)
//
//print(heap)
