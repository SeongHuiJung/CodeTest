import Foundation

let N = Int(readLine()!)!
var list = [Int]()
for i in 0..<N {
    let input = Int(readLine()!)!
    list.append(input)
}
list.sort(by:<)
list.forEach { print($0) }
