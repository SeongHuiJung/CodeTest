import Foundation

Int(readLine()!)!
let list = readLine()!.split{$0==" "}.map{Int(String($0))!}.sorted(by: <)

Int(readLine()!)!
let findList = readLine()!.split{$0==" "}.map{Int(String($0))!}

for i in 0..<findList.count {
    print(binaryFind(target: findList[i], left: 0, right: list.count - 1))
}

func binaryFind(target: Int, left: Int, right: Int) -> Int {
    if left > right {
        return 0
    }
    
    let mid = (left + right) / 2
    if list[mid] == target {
        return 1
    }
    else if list[mid] < target {
        return binaryFind(target: target, left: mid + 1, right: right)
    }
    else {
        return binaryFind(target: target, left: left, right: mid - 1)
    }
}