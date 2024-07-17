import Foundation

let NM = readLine()!.split{$0==" "}.map{Int(String($0))!}
let N = NM[0] // 가로길이
let M = NM[1] // 세로길이
var map = [[Character]](repeating: [Character](), count: M)
for i in 0..<M {
    map[i] = Array(readLine()!)
}
var cnt = 0
var Wcnt = 0
var Bcnt = 0
let dx = [0,0,1,-1]
let dy = [1,-1,0,0]
for i in 0..<M {
    for j in 0..<N {
        cnt = 0
        if map[i][j] != "X" {
            if map[i][j] == "B" {
                dfs(x: i, y: j, color: map[i][j])
                Bcnt += cnt*cnt
            }
            else {
                dfs(x: i, y: j, color: map[i][j])
                Wcnt += cnt*cnt
            }

        }
    }
}
print(Wcnt, Bcnt)
func dfs(x: Int, y: Int, color: Character) {
    cnt += 1
    map[x][y] = "X"
    for i in 0..<4 {
        let currentX = x + dx[i]
        let currentY = y + dy[i]
        
        if currentX < 0 || currentX >= M || currentY < 0 || currentY >= N {
            continue
        }
        if map[currentX][currentY] == color {
            dfs(x: currentX, y: currentY, color: color)
        }
    }
}
