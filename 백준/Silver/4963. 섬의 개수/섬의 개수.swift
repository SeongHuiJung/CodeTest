import Foundation

var NM = readLine()!.split{$0==" "}.map{Int(String($0))!}
var N = NM[0]
var M = NM[1]

var map = [[Int]]()
var visited = [[Bool]]()

let dx = [0, 1, 0, -1, -1, 1, -1, 1]
let dy = [1, 0, -1, 0, -1, 1, 1, -1]

while(N != 0 && M != 0) {
    map = [[Int]](repeating: [], count: M)
    visited = [[Bool]](repeating: [Bool](repeating: false, count: N), count: M)
    for i in 0..<M {
        map[i] = readLine()!.split{$0==" "}.map{Int(String($0))!}
    }
    
    var count = 0
    
    for i in 0..<M {
        for j in 0..<N {
            if visited[i][j] == false && map[i][j] == 1 {
                dfs(x:i, y:j)
                count += 1
            }
        }
    }
    print(count)
    
    NM = readLine()!.split{$0==" "}.map{Int(String($0))!}
    N = NM[0]
    M = NM[1]
}



func dfs(x: Int, y: Int) {
    visited[x][y] = true
    
    for i in 0..<8 {
        let currentX = dx[i] + x
        let currentY = dy[i] + y
        
        if currentX < 0 || currentX >= M || currentY < 0 || currentY >= N || visited[currentX][currentY] == true { continue }
        
        if map[currentX][currentY] == 1 { dfs(x: currentX, y: currentY) }
    }
}
