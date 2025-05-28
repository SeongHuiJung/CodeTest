import Foundation

let NM = readLine()!.split{$0==" "}.map{Int(String($0))!}
let N = NM[0]
let M = NM[1]
var map = [[Int]](repeating: [], count: N)
var meltAmount = [[Int]](repeating: [Int](repeating: N, count: M), count: N)
for i in 0..<N {
    map[i] = readLine()!.split{$0==" "}.map{Int(String($0))!}
}

let dx = [0,1,0,-1]
let dy = [1,0,-1,0]
var visited = [[Bool]](repeating: [Bool](repeating: false, count: M), count: N)

var cnt = 0
var year = 0
while(true) {
    visited = [[Bool]](repeating: [Bool](repeating: false, count: M), count: N)
    cnt = 0
    for i in 1..<N - 1 {
        for j in 1..<M - 1 {
            if visited[i][j] == false && map[i][j] > 0{
                dfs(x: i, y: j)
                cnt += 1
            }
            
        }
    }
    var flag = false
    checkZero: for i in 0..<N {
        for j in 0..<M {
            if map[i][j] > 0 {
                flag = true
                break checkZero
            }
        }
    }
    
    if flag == false {
        print(0)
        break
    }
    
    if cnt > 1 {
        print(year)
        break
    }
    
    for i in 1..<N - 1 {
        for j in 1..<M - 1 {
            if map[i][j] > 0 {
                var area = 0
                if map[i + 1][j] <= 0 { area += 1 }
                if map[i - 1][j] <= 0 { area += 1 }
                if map[i][j + 1] <= 0 { area += 1 }
                if map[i][j - 1] <= 0 { area += 1 }
                
                meltAmount[i][j] = area
            }
        }
    }
    
    for i in 1..<N - 1 {
        for j in 1..<M - 1 {
            if map[i][j] > 0 {
                map[i][j] -= meltAmount[i][j]
            }
        }
    }
    
    year += 1
}

func dfs(x: Int, y: Int) {
    visited[x][y] = true
    
    for i in 0..<4 {
        let currentX = x + dx[i]
        let currentY = y + dy[i]
        
        if visited[currentX][currentY] == true { continue }
        if currentX < 0 || currentX >= N || currentY < 0 || currentY >= M { continue }
        if map[currentX][currentY] > 0 { dfs(x: currentX, y: currentY) }
    }
}