import Foundation

let N = readLine()!.split{$0==" "}.map{Int(String($0))!}
var map = [[Int]](repeating: [Int](repeating: 0, count: N[1]), count: N[0])
for i in 0...N[0]-1 {
    map[i] = Array(readLine()!).map{Int(String($0))!}
}
let line = [-1, 0, 1, 0]
let row = [0, 1, 0, -1]
var queue: [(Int,Int)] = [(0,0)]
while (true) {
    bfs()
    if queue.isEmpty == true {
        break
    }
}
print(map[N[0]-1][N[1]-1])

func bfs() {
    var nextQueue: [(Int,Int)] = []
    for cur in queue {
        for i in 0...3 {
            // 현재 확인하고 있는 노드의 상하좌우 노드를 정의
            let nodeLine = cur.0 + line[i]
            let nodeRow = cur.1 + row[i]
            
            // map 인덱스 초과하는지 검사
            if nodeLine < 0 || nodeLine > N[0]-1 || nodeRow < 0 || nodeRow > N[1]-1 {
                continue
            }
            
            // 갈 수있는 길인지 검사
            if map[nodeLine][nodeRow] == 1 {
                // 0,0 으로부터 떨어진 거리
                map[nodeLine][nodeRow] = map[cur.0][cur.1] + 1
                
                // 방문할 큐에 추가
                nextQueue.append((nodeLine,nodeRow))
            }
        }
    }
    queue = nextQueue
}