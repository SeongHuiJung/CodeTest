import Foundation

let N = Int(readLine()!)!
var inoutDoor = Array(readLine()!).map{Int(String($0))!}
var edge = [[Int]](repeating: [], count: N + 1)
var visited = [Bool](repeating: false, count: N + 1)

inoutDoor.insert(0, at:0)

for _ in 0..<N - 1 {
    let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
    edge[input[0]].append(input[1])
    edge[input[1]].append(input[0])
}

var count = 0

for i in 1...N {
    visited = [Bool](repeating: false, count: N + 1)
    if inoutDoor[i] == 1 {
        dfs(item: i)
    }
}

print(count)

func dfs(item: Int) {
    visited[item] = true
    
    for i in 0..<edge[item].count {
        if !visited[edge[item][i]] {
            // 실내
            if inoutDoor[edge[item][i]] == 1 {
                count += 1
                if inoutDoor[item] == 1 { return }
            }
            // 실외
            else {
                dfs(item: edge[item][i])
            }
        }
    }
}