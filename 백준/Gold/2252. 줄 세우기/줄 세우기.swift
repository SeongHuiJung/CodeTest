import Foundation

struct Queue {
    var left = [Int]()
    var right = [Int]()
    
    mutating func enqueue(item: Int) {
        left.append(item)
    }
    
    mutating func dequeue() -> Int {
        if right.isEmpty {
            right = left.reversed()
            left.removeAll()
        }
        return right.popLast()!
    }
    
    mutating func count() -> Int {
        return left.count + right.count
    }
}


let NM = readLine()!.split{$0==" "}.map{Int(String($0))!}

let N = NM[0] // 학생수
let M = NM[1] // 비교한 회수

var edgeList = [[Int]](repeating: [], count: N) // V, 간선
var inDegree = [Int](repeating: 0, count: N) // 진입 리스트

for _ in 0..<M {
    let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
    let first = input[0] - 1
    let second = input[1] - 1
    edgeList[first].append(second)
    inDegree[second] += 1
}

var queue = Queue()

// 진입차수가 0이면 큐에 넣음
for i in 0..<N {
    if inDegree[i] == 0 {
        queue.enqueue(item: i)
    }
}

var result = [Int]()
test()

func test() {
    while(queue.count() != 0) {
        // 큐에서 빼기
        let dequeuedIndex = queue.dequeue()
        result.append(dequeuedIndex + 1)
        
        // 뺀 아이템에서 진출하는 값 모두 삭제
        while(!edgeList[dequeuedIndex].isEmpty) {
            let willRemoveInDegree = edgeList[dequeuedIndex].popLast()!
            inDegree[willRemoveInDegree] -= 1
            
            // 진입차수가 0인 노드를 큐에 넣음
            if inDegree[willRemoveInDegree] == 0 {
                queue.enqueue(item: willRemoveInDegree)
            }
        }
    }
}

print(result.map { String($0) }.joined(separator: " "))
           
