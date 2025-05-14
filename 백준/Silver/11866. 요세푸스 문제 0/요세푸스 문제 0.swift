import Foundation

struct Queue {
    var left = [Int]()
    var right = [Int]()
    
    mutating func enqueue(_ item: Int) {
        left.append(item)
    }
    
    mutating func dequeue() -> Int {
        if right.isEmpty {
            right = left.reversed()
            left.removeAll()
        }
        return right.popLast()!
    }
    
    mutating func count() -> Int {
        return left.count + right.count
    }
}

let NK = readLine()!.split{$0==" "}.map{Int(String($0))!}
let N = NK[0]
let K = NK[1]

var queue = Queue()

for i in 1...N {
    queue.enqueue(i)
}

var count = 0
var result = [Int]()

while(queue.count() != 0) {
    let item = queue.dequeue()
    count += 1
    if count != K {
        queue.enqueue(item)
    }
    else {
        result.append(item)
        count = 0
    }
}
print("<", terminator: "")
print(result.map{String($0)}.joined(separator: ", "), terminator: "")
print(">")