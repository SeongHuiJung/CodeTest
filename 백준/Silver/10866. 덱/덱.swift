import Foundation
struct Deque {
    var inQueue = [Int]()
    var outQueue = [Int]()
    
    // 비어 있으면 1
    // 차 있으면 0
    mutating func isEmpty() -> Int {
        if inQueue.isEmpty && outQueue.isEmpty {return 1}
        return 0
    }
    
    mutating func size() -> Int {
        return inQueue.count + outQueue.count
    }
    
    mutating func pushFront(_ a: Int) {
        inQueue.append(a)
    }
    mutating func pushBack(_ a: Int) {
        outQueue.append(a)
    }
    mutating func popFront() -> Int {
        if isEmpty() == 1 {return -1}
        
        if inQueue.isEmpty {
            fillInQueue()
        }
        return inQueue.popLast()!
    }
    mutating func popBack() -> Int {
        if isEmpty() == 1 {return -1}
        
        if outQueue.isEmpty {
            fillOutQueue()
        }
        return outQueue.popLast()!
    }
    mutating func front() -> Int {
        if isEmpty() == 1 {return -1}
        if inQueue.isEmpty {
            fillInQueue()
        }
        return inQueue.last!
    }
    mutating func back() -> Int {
        if isEmpty() == 1 {return -1}
        if outQueue.isEmpty {
            fillOutQueue()
        }
        return outQueue.last!
    }
    
    private mutating func fillInQueue() {
        inQueue = outQueue.reversed()
        outQueue.removeAll()
    }
    private mutating func fillOutQueue() {
        outQueue = inQueue.reversed()
        inQueue.removeAll()
    }
}

var deque = Deque()
let N = Int(readLine()!)!
for i in 0..<N {
    let input = readLine()!
    if input == "pop_front" {print(deque.popFront())}
    else if input == "pop_back" {print(deque.popBack())}
    else if input == "size" {print(deque.size())}
    else if input == "empty" {print(deque.isEmpty())}
    else if input == "front" {print(deque.front())}
    else if input == "back" {print(deque.back())}
    else {
        let cmd = input.split{$0==" "}.map{String($0)}
        
        if cmd[0] == "push_front" {deque.pushFront(Int(cmd[1])!)}
        else if cmd[0] == "push_back" {deque.pushBack(Int(cmd[1])!)}
    }
}
