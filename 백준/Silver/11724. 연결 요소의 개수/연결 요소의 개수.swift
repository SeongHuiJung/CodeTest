import Foundation
var NM = readLine()!.split{$0==" "}.map{Int(String($0))!}
let N = NM[0]
let M = NM[1]
var map: [[Int]] = [[Int]](repeating: [], count: N)
var visited = [Bool](repeating: false, count: N)
for i in 0..<M {
    let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
    let uNode = input[0] - 1
    let vNode = input[1] - 1
    
    map[uNode].append(vNode)
    map[vNode].append(uNode)
}
var cnt = 0
for i in 0..<N {
    if visited[i] == false {
        // 연결된 간선이 하나도 없는 경우
        if map[i].isEmpty {
            visited[i] = true
            // 연결된 정점이 없더라도 노드 하나로서 하나의 그래프이므로 추가+1
            cnt += 1
        }
        // 연결된 간선이 있는 경우
        else {
            dfs(u : i)
            cnt += 1
        }
    }
}
print(cnt)

func dfs(u : Int) {
    visited[u] = true
    for i in 0..<map[u].count {
        if visited[map[u][i]] == false {
            //visited[map[u][i]] = true
            dfs(u: map[u][i])
        }
    }
}
