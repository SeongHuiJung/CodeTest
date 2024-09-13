import Foundation
struct Data {
    var num: Int
    var priority: Int
}

struct Queue {
    var inQueue = [Data]()
    var outQueue = [Data]()
    
    mutating func enqueue(num a: Int, priority b: Int) {
        inQueue.append(Data(num: a, priority: b))
    }
    mutating func dequeue() -> Data {
        if outQueue.isEmpty {
            outQueue = inQueue.reversed()
            inQueue.removeAll()
        }
        return outQueue.popLast()!
    }
    mutating func firstElement() -> Data {
        if outQueue.isEmpty {
            outQueue = inQueue.reversed()
            inQueue.removeAll()
        }
        return outQueue.last!
    }
    mutating func size() -> Int {
        return outQueue.count + inQueue.count
    }
    mutating func removeAll() {
        inQueue.removeAll()
        outQueue.removeAll()
    }
    mutating func printAll() {
        if outQueue.isEmpty {
            outQueue = inQueue.reversed()
            inQueue.removeAll()
        }
        print("num: ", terminator: "")
        for i in stride(from: outQueue.count - 1, to: -1, by: -1) {
            print(outQueue[i].num, terminator: "")
        }
        print("\npriority: ", terminator: "")
        for i in stride(from: outQueue.count - 1, to: -1, by: -1) {
            print(outQueue[i].priority, terminator: "")
        }
    }
    mutating func printIdxElement(_ idx: Int) -> Data {
        if outQueue.isEmpty {
            outQueue = inQueue.reversed()
            inQueue.removeAll()
        }
        if idx >= outQueue.count {
            return inQueue[idx - outQueue.count]
        }
        
        return outQueue[outQueue.count - 1 - idx]
    }
}

func sortPriority(queue : inout Queue) -> Data {

    
    var currentPriority = queue.firstElement().priority
    var index = 0
    for i in 0..<queue.size() {
        if currentPriority < queue.printIdxElement(i).priority {
            currentPriority = queue.printIdxElement(i).priority
            index = i
        }
    }
    var tmp: Data
    // i 가 0 이 아닌 경우, 더 큰 우선순위를 가진 아이템이 존재
    if index != 0 {
        for _ in 0..<index {
            tmp = queue.dequeue()
            queue.enqueue(num: tmp.num, priority: tmp.priority)
        }
    }
    return queue.dequeue()
}

let tc = Int(readLine()!)!
var queue = Queue()
for _ in 0..<tc {
    queue.removeAll()
    let NM = readLine()!.split{$0==" "}.map{Int(String($0))!}
    let N = NM[0]
    let M = NM[1]
    let priorityInput = readLine()!.split{$0==" "}.map{Int(String($0))!}
    var count = 0
    
    for i in 0..<N {
        queue.enqueue(num: i, priority: priorityInput[i])
    }
    while(true) {
        count += 1
        if (sortPriority(queue: &queue).num == M) {
            print(count)
            break
        }
    }
}


