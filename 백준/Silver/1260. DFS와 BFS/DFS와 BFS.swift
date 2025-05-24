import Foundation

struct Queue {
    var left = [Int]()
    var right = [Int]()
    
    mutating func enqueue(_ item: Int) {
        left.append(item)
    }
    
    mutating func dequeue() -> Int {
        if right.count == 0 {
            right = left.reversed()
            left.removeAll()
        }
        return right.popLast()!
    }
    
    func count() -> Int {
        return left.count + right.count
    }
}

let NMV = readLine()!.split{$0==" "}.map{Int(String($0))!}
let N = NMV[0]
let M = NMV[1]
let V = NMV[2]

var map = [[Int]](repeating: [], count: N + 1)
var visited = [Bool](repeating: false, count: N + 1)

for _ in 0..<M {
    let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
    map[input[0]].append(input[1])
    map[input[1]].append(input[0])
}

for i in 1...N {
    map[i].sort(by:<)
}

var dfsResult = [Int]()
dfs(idx: V)
print(dfsResult.map{String($0)}.joined(separator: " "))

var bfsResult = [Int]()
var queue = Queue()
visited = [Bool](repeating: false, count: N + 1)
queue.enqueue(V)
visited[V] = true
bfs()
print(bfsResult.map{String($0)}.joined(separator: " "))


func dfs(idx: Int) {
    visited[idx] = true
    dfsResult.append(idx)

    for i in 0..<map[idx].count {
        if !visited[map[idx][i]] {
            dfs(idx: map[idx][i])
        }
    }
}

func bfs() {
    while(queue.count() != 0) {
        let item = queue.dequeue()
        bfsResult.append(item)

        for i in 0..<map[item].count {
            if !visited[map[item][i]] {
                queue.enqueue(map[item][i])
                visited[map[item][i]] = true
            }
        }
    }
}