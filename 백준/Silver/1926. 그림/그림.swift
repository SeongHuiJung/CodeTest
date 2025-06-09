import Foundation
//6 5
//1 1 0 1 1
//0 1 1 0 0
//0 0 0 0 0
//1 0 1 1 1
//0 0 1 1 1
//0 0 1 1 1
let NM = readLine()!.split{$0==" "}.map{Int(String($0))!}
let N = NM[0]
let M = NM[1]
var map = [[Int]](repeating: [], count: N)
var visited = [[Bool]](repeating: [Bool](repeating: false, count: M), count: N)

let dx = [0,1,0,-1]
let dy = [1,0,-1,0]

for i in 0..<N {
    map[i] = readLine()!.split{$0==" "}.map{Int(String($0))!}
}

var max = 0
var cnt = 0

for i in 0..<N {
    for j in 0..<M {
        if !visited[i][j] && map[i][j] == 1 {
            let area = dfs(x: i, y: j, area: 1)
            if max < area { max = area }
            
            cnt += 1
        }
    }
}

print(cnt)
print(max)

func dfs(x: Int, y: Int, area: Int) -> Int {
    var resultArea = area
    
    visited[x][y] = true
    for i in 0..<4 {
        let currentX = dx[i] + x
        let currentY = dy[i] + y
        
        if currentX < 0 || currentX >= N || currentY < 0 || currentY >= M { continue }
        
        if map[currentX][currentY] == 1 && !visited[currentX][currentY] {
            resultArea =  dfs(x:currentX, y: currentY, area: resultArea + 1)
        }
    }
    
    return resultArea
}
