import Foundation

let N = Int(readLine()!)!
let top = readLine()!.split{$0==" "}.map{Int(String($0))!}

var stack = [Int]() // idx
var result = [Int](repeating: -1, count: N)

stack.append(0)

for i in 1..<N {
    while(stack.count != 0 && top[stack.last!] < top[i] ) {
        result[stack.popLast()!] = top[i]
    }
    stack.append(i)
}

print(result.map{String($0)}.joined(separator: " "))