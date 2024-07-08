import Foundation
let NK = readLine()!.split{$0==" "}.map{Int(String($0))!}
let N = NK[0]
let K = NK[1]
var queue: [Int] = [N]
var cnt = 0
var visited = [Bool](repeating: false, count: 100001) // *주의* 범위가 0~100,000이므로 count+1 해줘야함
visited[N] = true
while(true) {
    bfs()
    if queue.isEmpty == true {
        break
    }
}
print(cnt)
func bfs() {
    var nextQueue: [Int] = []
    for cur in queue {
        if cur == K {
            queue = []
            return
        }
        else if cur < K {
            if cur * 2 <= 100000 {
                if visited[cur*2] == false {
                    nextQueue.append(cur*2)
                    visited[cur*2] = true
                }
            }
            // testcase: 99999 100000
            // 이 경우 부등호를 <가 아닌 <=가 되어야함
            // 인덱스 주의
            if cur + 1 <= 100000 {
                if visited[cur+1] == false{
                    nextQueue.append(cur+1)
                    visited[cur+1] = true
                }
            }
            if cur - 1 >= 0 {
                if visited[cur-1] == false {
                    nextQueue.append(cur-1)
                    visited[cur-1] = true
                }
            }
        }
        else {
            if cur - 1 >= 0 {
                if visited[cur-1] == false {
                    nextQueue.append(cur-1)
                    visited[cur-1] = true
                }
            }
        }
    }
    cnt += 1
    queue = nextQueue
}