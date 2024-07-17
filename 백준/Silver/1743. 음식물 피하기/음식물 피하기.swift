import Foundation

let NMK = readLine()!.split{$0==" "}.map{Int(String($0))!}
let N = NMK[0]
let M = NMK[1]
let K = NMK[2]

var map = [[Int]](repeating: [Int](repeating: 0, count: M), count: N)

for i in 0..<K {
    let nm = readLine()!.split{$0==" "}.map{Int(String($0))!}
    map[nm[0]-1][nm[1]-1] = 1
}

var cnt = 0
var dx : [Int] = [-1,0,1,0]
var dy : [Int] = [0,1,0,-1]
var answer = 0
for i in 0..<N {
    for j in 0..<M {
        if map[i][j] == 1 {
            cnt = 0
            dfs(x: i, y: j)
            answer = max(answer,cnt)
        }
    }
}
print(answer)
func dfs(x: Int, y: Int) {
    cnt += 1
    map[x][y] = -1
    for i in 0..<4 {
        let currentX = dx[i] + x
        let currentY = dy[i] + y
        
        if currentX < 0 || currentX >= N || currentY < 0 || currentY >= M {
            continue
            // 아래 줄로 작성해서 for 문을 돌지 않는 오류 발생 return 이 아닌 continue 로 해야함을 주의!
            // return
        }
        
        if map[currentX][currentY] == 1 {
            dfs(x: currentX, y: currentY)
        }
    }
}