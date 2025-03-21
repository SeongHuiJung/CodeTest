import Foundation

let computerCount = Int(readLine()!)!
let connectCount = Int(readLine()!)!

var map = [[Int]](repeating: [Int](repeating: 0, count: computerCount), count: computerCount)
var resultVisted = [Int](repeating: 0, count: computerCount)

for _ in 0..<connectCount {
    let NM = readLine()!.split {$0 == " "}.map{Int(String($0))!}
    let N = NM[0]
    let M = NM[1]
    map[N - 1][M - 1] = 1
    map[M - 1][N - 1] = 1
}

dfs(x:0, y:0)

func dfs(x: Int, y: Int) {
    resultVisted[x] = 1
    for i in 0..<computerCount {
        if map[x][i] == 1 && resultVisted[i] == 0 {
            dfs(x: i, y: x)
        }
    }
}

print(resultVisted.reduce(0) {$0 + $1} - 1)