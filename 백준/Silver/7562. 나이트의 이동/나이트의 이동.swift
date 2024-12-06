import Foundation

struct Queue {
    var leftQueue: [(Int,Int)] = []
    var rightQueue: [(Int,Int)] = []
    
    mutating func enqueue(_ x: Int, _ y: Int) {
        leftQueue.append((x,y))
    }
    
    mutating func dequeue() -> (Int,Int) {
        if rightQueue.isEmpty {
            rightQueue = leftQueue.reversed()
            leftQueue.removeAll()
        }
        return rightQueue.popLast()!
    }
    
    mutating func count() -> Int {
        return leftQueue.count + rightQueue.count
    }
    
    mutating func isEmpty() -> Bool {
        if leftQueue.isEmpty && rightQueue.isEmpty {
            return true
        }
        return false
    }
    
    mutating func removeAll() {
        leftQueue.removeAll()
        rightQueue.removeAll()
    }
}

let testcase = Int(readLine()!)!

var dx = [-2, -1, 1, 2, 2, 1, -1, -2]
var dy = [1, 2, 2, 1, -1, -2, -2, -1]

for _ in 0..<testcase {
    let N = Int(readLine()!)!
    let start = readLine()!.split{$0==" "}.map{Int(String($0))!}
    let end = readLine()!.split{$0==" "}.map{Int(String($0))!}
    
    var startX = start[0]
    var startY = start[1]
    
    let endX = end[0]
    let endY = end[1]
    
    var queue = Queue()
    queue.enqueue(startX, startY)
    
    // 방문 초기화
    var map = [[Bool]](repeating: [Bool](repeating: false, count: N), count: N)
    map[startX][startY] = true
    
    
    var count = 0
    if startX != endX || startY != endY {
        while(!queue.isEmpty()) {
            bfs()
            count += 1
        }
    }
    print(count)
    
    func bfs() {
        out: for turn in 0..<queue.count() {
            let night = queue.dequeue()
            for i in 0..<8 {
                let currentX = night.0 + dx[i]
                let currentY = night.1 + dy[i]
                
                guard currentX >= 0 && currentX < N && currentY >= 0 && currentY < N && map[currentX][currentY] == false else { continue }
                
                // 종료조건 : 도착지점에 도착
                if currentX == endX && currentY == endY {
                    queue.removeAll()
                    break out
                }
                // 다음에 갈 곳 큐에 추가
                else {
                    // 방문표기
                    map[currentX][currentY] = true
                    queue.enqueue(currentX, currentY)
                }
            }
        }
    }
}