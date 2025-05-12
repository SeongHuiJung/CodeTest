import Foundation

let N = Int(readLine()!)!
var map = [[Int]](repeating: [], count: N)
var visited = [[Bool]](repeating: [Bool](repeating: false, count: N), count: N)
var max = 0
var count = 0

for i in 0..<N {
    map[i] = readLine()!.split{$0==" "}.map{Int(String($0))!}
}


let dx = [0,1,0,-1]
let dy = [1,0,-1,0]

func dfs(_ x: Int, _ y: Int, _ height: Int) {
    visited[x][y] = true
    for i in 0..<4 {
        let currentX = dx[i] + x
        let currentY = dy[i] + y

        guard currentX >= 0 && currentX < N && currentY >= 0 && currentY < N && visited[currentX][currentY] == false && map[currentX][currentY] > height else { continue }
        
        dfs(currentX,currentY,height)
    }
}


for height in 0...100 {
    visited = [[Bool]](repeating: [Bool](repeating: false, count: N), count: N)
    count = 0
    for i in 0..<N {
        for j in 0..<N {
            // 안전한 영역 지역 ++
            if map[i][j] > height && visited[i][j] == false {
                dfs(i,j,height)
                count += 1
            }
        }
    }
    if max < count { max = count }
    
    // 모든 지역이 물에 잠김, 선회 중단
    if count == 0 { break }
}

print(max)