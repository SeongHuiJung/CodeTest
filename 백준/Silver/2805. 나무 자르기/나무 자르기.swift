import Foundation

let NM = readLine()!.split{$0==" "}.map{Int(String($0))!}
let N = NM[0]
let M = NM[1]

let trees = readLine()!.split{$0==" "}.map{Int(String($0))!}.sorted(by: <)
let max = trees.last!


var left = 0
var right = max
while(left <= right) {
    
    let mid = (left + right) / 2
    var sum = 0
    trees.forEach {
        if $0 - mid > 0 {
            sum += $0 - mid
        }
    }
    if M > sum { right = mid - 1 }
    else { left = mid + 1 }
}
print(left - 1)