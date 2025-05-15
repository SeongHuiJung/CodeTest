import Foundation

struct Queue {
    var left = [(Int,Int)]()
    var right = [(Int,Int)]()
    
    mutating func enqueue(_ item: (Int,Int)) {
        left.append(item)
    }
    
    mutating func dequeue() -> (Int,Int)? {
        if right.isEmpty {
            right = left.reversed()
            left.removeAll()
        }
        return right.popLast()
    }
    
    mutating func count() -> Int {
        return left.count + right.count
    }
    
    mutating func isContain(x:Int, y:Int) -> Bool {
        var list = left.reversed() + right
        list.reverse()
        list.popLast()
        for i in 0..<list.count {
            if list[i] == (x,y) { return true }
        }
        
        return false
    }
}

let N = Int(readLine()!)!
let K = Int(readLine()!)!
var apple = [[Bool]](repeating: [Bool](repeating: false, count: N), count: N)


for i in 0..<K {
    let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
    apple[input[0] - 1][input[1] - 1] = true
}

let L = Int(readLine()!)!
var direction = [[String]](repeating: [], count: L)

for i in 0..<L {
    direction[i] = readLine()!.split{$0==" "}.map{String($0)}
}

direction.reverse()

var x = 0
var y = 0

// 0 : 위
// 1 : 오른
// 2 : 아래
// 3 : 왼
var currentDir = 1
var count = 0

var queue = Queue()
queue.enqueue((0,0))

stop: while(true) {
    count += 1
    
    switch currentDir {
    case 0 :
        x -= 1
        if x < 0 { break stop }
    case 1 :
        y += 1
        if y >= N { break stop}
    case 2 :
        x += 1
        if x >= N { break stop}
    case 3:
        y -= 1
        if y < 0 { break stop }
    default: break
    }
    queue.enqueue((x,y))
    
    // 머리가 꼬리에 닿는지 확인
    if queue.isContain(x: x, y: y) { break stop }
    
    // 사과 존재 유무 확인
    if !apple[x][y] {
        queue.dequeue()
    }
    else {
        // 사과 존재o, 먹고 없앰
        apple[x][y] = false
    }
    
    // 방향 전환
    if !direction.isEmpty && count == Int(direction.last![0])! {
        currentDir = changeDirection(currentDir: currentDir, change: direction.popLast()![1])
    }
}

print(count)

func changeDirection(currentDir: Int, change: String) -> Int {
    var result = currentDir
    if change == "D" {
        result += 1
        if result == 4 { result = 0 }
    }
    else {
        result -= 1
        if result == -1 { result = 3 }
    }
    
    return result
}
