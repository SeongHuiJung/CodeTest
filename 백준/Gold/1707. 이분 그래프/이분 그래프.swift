import Foundation

let testcase = Int(readLine()!)!

for _ in 0..<testcase {
    let VE = readLine()!.split{$0==" "}.map{Int(String($0))!}
    let V = VE[0]
    let E = VE[1]
    
    // -1 : not visited
    // 0 : white
    // 1 : black
    var visited = [Int](repeating: -1, count: V + 1)
    var map = [[Int]](repeating: [], count: V + 1)

    for _ in 0..<E {
        let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
        if input[0] != input[1] {
            map[input[0]].append(input[1])
            map[input[1]].append(input[0])
        }
    }
    
    var flag = false
    
    for i in 1..<V {
        if visited[i] == -1 {
            visited[i] = 0
            if dfs(item: i, map: &map, visited: &visited) == false {
                flag = true
                break
            }
        }
    }

    if flag == true { print("NO") }
    else { print("YES") }
}

func dfs(item: Int, map: inout [[Int]], visited: inout [Int]) -> Bool {
    
    var result = true
    
    for i in 0..<map[item].count {
        // 새로 방문하는 곳
        if visited[map[item][i]] == -1 {
            if visited[item] == 0 { visited[map[item][i]] = 1 }
            else { visited[map[item][i]] = 0 }
            
            result = dfs(item: map[item][i], map: &map, visited: &visited)
        }
        
        // 이미 방문했던 곳
        else {
            if visited[item] == visited[map[item][i]] {
                
                return false
            }
        }
    }
    return result
}
