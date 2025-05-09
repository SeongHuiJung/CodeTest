import Foundation

var list = [[String]](repeating: [], count: 50)
let N = Int(readLine()!)!

// O(n^2)
for i in 0..<N {
    let str = String(readLine()!)
    if !list[str.count - 1].contains(str) {
        list[str.count - 1].append(str)
    }
}

// O(n)
for i in 0..<50 {
    if !list[i].isEmpty {
        list[i].sort(by:<)
        list[i].forEach {print($0)}
    }
}