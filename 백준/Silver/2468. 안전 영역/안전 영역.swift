import Foundation

let N = Int(readLine()!)!
var map = [[Int]](repeating: [], count: N)
var visited = [[Bool]](repeating: [Bool](repeating: false, count: N), count: N)

for i in 0..<N {
    map[i] = readLine()!.split{$0==" "}.map{Int(String($0))!}
}

var maxCount = 0

let dx = [0,1,0,-1]
let dy = [1,0,-1,0]

for height in 0...100 {
    var count = 0
    visited = [[Bool]](repeating: [Bool](repeating: false, count: N), count: N)
    
    for i in 0..<N {
        for j in 0..<N {
            if !visited[i][j] && map[i][j] > height {
                dfs(height: height, x: i, y: j)
                count += 1
            }
        }
    }
    if count == 0 {break}
    if maxCount < count { maxCount = count }
}

print(maxCount)

func dfs(height: Int, x: Int, y: Int) {
    visited[x][y] = true
    
    for i in 0..<4 {
        let currentX = dx[i] + x
        let currentY = dy[i] + y
        
        if currentX < 0 || currentX >= N || currentY < 0 || currentY >= N {
            continue
        }

        if !visited[currentX][currentY] && map[currentX][currentY] > height {
            dfs(height: height, x: currentX, y: currentY)
        }
    }
}
