import Foundation
let N = Int(readLine()!)!
var list = [[Int]](repeating: [Int](repeating: 0, count: 2), count: N)
for i in 0..<N {
    list[i] = readLine()!.split{$0==" "}.map{Int(String($0))!}
}
var cnt = 0
for i in 0..<N {
    cnt = 0
    for j in 0..<N {
        if list[i][0] < list[j][0] && list[i][1] < list[j][1] {
            cnt += 1
        }
    }
    print(cnt+1)
}