import Foundation

let NM = readLine()!.split{$0==" "}.map{Int(String($0))!}
let N = NM[0]
let M = NM[1]
var map = [[Int]](repeating: [], count: N + 1)
var visited = [Bool](repeating: false, count: N + 1)
var count = 0

for i in 0..<M {
    let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
    map[input[0]].append(input[1])
    map[input[1]].append(input[0])
}

for i in 1...N {
    if !visited[i] {
        dfs(i)
        count += 1
    }
}

print(count)

func dfs(_ idx: Int) {
    visited[idx] = true
    
    for i in 0..<map[idx].count {
        if !visited[map[idx][i]] {
            dfs(map[idx][i])
        }
    }
}
