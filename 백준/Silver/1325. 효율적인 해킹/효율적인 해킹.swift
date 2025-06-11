import Foundation

var input = readLine()!.split(separator: " ").map { Int($0)! }
let (N, M) = (input[0], input[1])

var graph = [[Int]](repeating: [], count: N + 1)

for _ in 0..<M {
    let edge = readLine()!.split(separator: " ").map { Int($0)! }
    let (a, b) = (edge[0], edge[1])
    // b -> a로 바꿈 (해킹당할 수 있는 방향으로 저장)
    graph[b].append(a)
}

func bfs(start: Int) -> Int {
    var visited = [Bool](repeating: false, count: N + 1)
    var q = [start]
    visited[start] = true
    var count = 1

    var idx = 0
    while idx < q.count {
        let node = q[idx]
        idx += 1
        for next in graph[node] {
            if !visited[next] {
                visited[next] = true
                q.append(next)
                count += 1
            }
        }
    }
    return count
}

var result = [Int]()
var maxCount = 0

for i in 1...N {
    let count = bfs(start: i)
    if count > maxCount {
        maxCount = count
        result = [i]
    } else if count == maxCount {
        result.append(i)
    }
}

print(result.sorted().map { String($0) }.joined(separator: " "))
