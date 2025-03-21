import Foundation

let MNK = readLine()!.split{$0 == " "}.map{Int(String($0))!}
let M = MNK[0]
let N = MNK[1]
let K = MNK[2]

var map = [[Bool]](repeating: [Bool](repeating: false, count: M), count: N)
var visited = [[Bool]](repeating: [Bool](repeating: false, count: M), count: N)

for _ in 0..<K {
    let input = readLine()!.split{$0 == " "}.map{Int(String($0))!}
    let startX = input[0]
    let startY = input[1]
    let endX = input[2]
    let endY = input[3]
    
    for i in startX..<endX {
        for j in startY..<endY {
            map[i][j] = true
        }
    }
}

let dirX = [0,1,0,-1]
let dirY = [1,0,-1,0]

var count = 0
var area = 0
var areaList : [Int] = []
for i in 0..<N {
    for j in 0..<M {
        if !map[i][j] && !visited[i][j] {
            area = 0
            dfs(x:i, y:j)
            areaList.append(area)
            count += 1
        }
    }
}
print(count)
print(areaList.sorted(by:<).reduce(""){String($0)+"\(String($1)) "})

func dfs(x: Int, y: Int) {
    visited[x][y] = true
    area += 1
    for direction in 0..<4 {
        let currentX = x + dirX[direction]
        let currentY = y + dirY[direction]
        
        if currentX < 0 || N <= currentX || currentY < 0 || M <= currentY { continue }
        
        if !map[currentX][currentY] && !visited[currentX][currentY] {
            dfs(x:currentX, y:currentY)
        }
    }
}