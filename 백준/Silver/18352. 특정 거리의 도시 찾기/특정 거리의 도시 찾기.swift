import Foundation

struct Queue {
    var left = [Int]()
    var right = [Int]()
    
    mutating func enqueue(_ x: Int) {
        left.append(x)
    }
    
    mutating func dequeue() -> Int {
        if right.isEmpty {
            right = left.reversed()
            left.removeAll()
        }
        return right.popLast()!
    }
    
    func isEmpty() -> Bool {
        if left.isEmpty && right.isEmpty {return true}
        return false
    }
}

let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let N = input[0] // 도시 개수
let M = input[1] // 도로 개수
let K = input[2] // 거리 정보
let X = input[3] // 출발 도시

var map = [[Int]](repeating: [], count: N + 1)
var visited = [Int](repeating: -1, count: N + 1)
for i in 0..<M {
    let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
    map[input[0]].append(input[1])
}

var queue = Queue()
var result = [Int]()

queue.enqueue(X)
visited[X] = 0

var flag = false

while(!queue.isEmpty()) {
    let item = queue.dequeue()
    if visited[item] == K {
        result.append(item)
        flag = true
    }
    else {
        for i in 0..<map[item].count {
            if visited[map[item][i]] == -1 {
                queue.enqueue(map[item][i])
                visited[map[item][i]] = visited[item] + 1
            }
        }
    }
}

if flag == false {
    print(-1)
}
else {
    result.sort(by: <)
    for i in 0..<result.count {
        print(result[i])
    }
}
