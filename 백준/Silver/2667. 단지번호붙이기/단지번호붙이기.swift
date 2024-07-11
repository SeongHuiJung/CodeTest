import Foundation

let N = Int(readLine()!)!
var map = [[Int]](repeating: [], count: N)
var visited = [[Int]](repeating: [Int](repeating: 0, count: N), count: N)
for i in 0..<N {
    map[i] = Array(readLine()!).map{Int(String($0))!}
}

let dy = [0, 1, 0, -1]
let dx = [1, 0, -1, 0]
var aparts: [Int] = []
for i in 0..<N {
    for j in 0..<N {
        if map[i][j] == 1{
            aparts.append(dfs(i,j,0)+1)
        }
    }
}
aparts.sort(by: <)
print(aparts.count)
for i in 0..<aparts.count {
    print(aparts[i])
}

func dfs(_ x:Int, _ y:Int, _ cnt: Int) -> Int {
    var count = cnt
    map[x][y] = -1 // 방문체크
    for i in 0..<4 {
        let curX = x + dx[i]
        let curY = y + dy[i]
        if curX >= 0 && curX < N && curY >= 0 && curY < N {
            if map[curX][curY] == 1 {
                count = dfs(curX,curY, count + 1)
            }
        }
    }
    return count
}
