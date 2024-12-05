import Foundation

struct Queue {
    var leftQueue : [(Int, Int)] = []
    var rightQueue : [(Int, Int)] = []
    
    mutating func enqueue(item : (Int,Int)) {
        leftQueue.append((item.0,item.1))
    }
    
    mutating func dequeue() -> (Int,Int) {
        if rightQueue.isEmpty {
            rightQueue = leftQueue.reversed()
            leftQueue.removeAll()
        }
        return rightQueue.popLast()!
    }
    
    mutating func isEmpty() -> Bool {
        if leftQueue.isEmpty && rightQueue.isEmpty {
            return true
        }
        return false
    }
    
    mutating func count() -> Int {
        return leftQueue.count + rightQueue.count
    }
}

let NM = readLine()!.split{$0==" "}.map{Int(String($0))!}
let N = NM[0]
let M = NM[1]

var map = [[Int]](repeating: [Int](), count: M)
for i in 0..<M {
    map[i] = readLine()!.split{$0==" "}.map{Int(String($0))!}
}

var queue = Queue()

let dx = [0,1,0,-1]
let dy = [1,0,-1,0]

func bfs() {
    for turn in 0..<queue.count() {
        let apple = queue.dequeue()
        for i in 0..<4 {
            let currentX = dx[i] + apple.0
            let currentY = dy[i] + apple.1
            
            // 다음 사과로 뻗어나갈 수 있는 조건
            guard currentX >= 0 && currentX < M && currentY >= 0 && currentY < N && map[currentX][currentY] == 0 else { continue }
            map[currentX][currentY] = 1
            queue.enqueue(item: (currentX,currentY))
        }
    }
}

for i in 0..<M {
    for j in 0..<N {
        if map[i][j] == 1 {
            queue.enqueue(item: (i,j))
        }
    }
}

var day = -1
while(!queue.isEmpty()) {
    bfs()
    day += 1
}

var flag = false

out: for i in 0..<M {
    for j in 0..<N {
        if map[i][j] == 0 {
            flag = true
            break out
        }
    }
}

if flag == false {
    print(day)
}
else {
    print(-1)
}
