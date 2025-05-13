import Foundation

let NM = readLine()!.split{$0==" "}.map{Int(String($0))!}
let N = NM[0]
let M = NM[1]

let trees = readLine()!.split{$0==" "}.map{Int(String($0))!}.sorted(by: <)
let max = trees.last!
let min = trees.first!

print(binarySearch(left: 0, right: max, last: 0))

func binarySearch(left: Int, right: Int, last: Int) -> Int {
    if left > right {
        return last
    }
    
    let mid = (left + right) / 2
    
    var sum = 0
    trees.forEach {
        if $0 - mid > 0 {
            sum += $0 - mid
        }
    }
    
    if M == sum {
        return mid
    }
    else if M < sum {
        return binarySearch(left: mid + 1, right: right, last: mid)
    }
    else {
        return binarySearch(left: left, right: mid - 1, last: mid - 1)
    }
}
