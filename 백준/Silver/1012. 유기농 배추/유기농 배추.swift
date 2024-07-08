import Foundation
let testcase = Int(readLine()!)!
let line = [-1, 0, 1, 0]
let row = [0, 1, 0, -1]
for i in 0...testcase-1 {
    let MNK = readLine()!.split{$0==" "}.map{Int(String($0))!}
    let M = MNK[0]
    let N = MNK[1]
    let K = MNK[2]
    var map = [[Int]](repeating: [Int](repeating: 0, count: N), count: M)
    for j in 0...K-1 {
        let XY = readLine()!.split{$0==" "}.map{Int(String($0))!}
        let X = XY[0]
        let Y = XY[1]
        map[X][Y] = 1
    }
    var visit = [[Int]](repeating: [Int](repeating: 0, count: N), count: M)
    var cnt = 0
    for i in 0...M-1 {
        for j in 0...N-1 {
            if map[i][j] == 1 && visit[i][j] == 0 {
                bfs(x: i, y: j, M: M, N: N, visit: &visit, map: &map)
                cnt += 1
            }
        }
    }
    print(cnt)
}

func bfs(x: Int, y: Int, M: Int, N: Int, visit: inout [[Int]], map: inout [[Int]]) {
    for i in 0...3 {
        let curLine = x + line[i]
        let curRow = y + row[i]
        
        if curLine >= 0 && curLine <= M-1 && curRow >= 0 && curRow <= N-1 
            && visit[curLine][curRow] == 0
            && map[curLine][curRow] == 1 {
            visit[curLine][curRow] = 1
            bfs(x: curLine, y: curRow, M: M, N: N, visit: &visit, map: &map)
        }
    }
}
