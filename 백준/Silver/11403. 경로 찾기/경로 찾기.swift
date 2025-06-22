import Foundation

let N = Int(readLine()!)!
var input = [[Int]](repeating: [], count: N)
var map = [[Int]](repeating: [], count: N)
var result = [[Int]](repeating: [Int](repeating: 0, count: N), count: N)
var visited = [Bool](repeating: false, count: N)

for i in 0..<N {
    let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
    
    for j in 0..<N {
        if input[j] == 1 {
            map[i].append(j)
        }
    }
}

for i in 0..<N {
    visited = [Bool](repeating: false, count: N)
    dfs(standard: i, idx: i)
}

for i in 0..<N {
    print(result[i].map{String($0)}.joined(separator: " "))
}

func dfs(standard: Int, idx: Int) {
    if standard != idx { visited[idx] = true }
    
    
    for i in 0..<map[idx].count {
        if visited[map[idx][i]] == false {
            result[standard][map[idx][i]] = 1
            dfs(standard: standard, idx: map[idx][i])
        }
    }
}