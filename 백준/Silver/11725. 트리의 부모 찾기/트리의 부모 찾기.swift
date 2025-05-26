import Foundation

let N = Int(readLine()!)!

var map = [[Int]](repeating: [], count: N + 1)
var visited = [Bool](repeating: false, count: N + 1)
var result = [Int](repeating: 0, count: N + 1)

for _ in 0..<N - 1 {
    let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
    map[input[0]].append(input[1])
    map[input[1]].append(input[0])
}

dfs(item: 1)

for i in 2...N {
    print(result[i])
}

func dfs(item: Int) {
    visited[item] = true
    
    for i in 0..<map[item].count {
        if !visited[map[item][i]] {
            result[map[item][i]] = item
            dfs(item: map[item][i])
        }
    }
}