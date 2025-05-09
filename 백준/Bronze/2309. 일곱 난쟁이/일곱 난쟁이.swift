import Foundation

var list = [Int]()
for i in 0..<9 {
    list.append(Int(readLine()!)!)
}

var sum = 0
list.forEach { sum += $0 }

var fake1Idx = 0
var fake2Idx = 0

stop: for i in 0..<9 {
    for j in 0..<9 {
        if i != j && sum - list[i] - list[j] == 100 {
            fake1Idx = max(i,j)
            fake2Idx = min(i,j)
            break stop
        }
    }
}

list.remove(at:fake1Idx)
list.remove(at:fake2Idx)

list.sort(by:<)
list.forEach {print($0)}
