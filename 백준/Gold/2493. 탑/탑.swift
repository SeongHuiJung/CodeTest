import Foundation
var stack : [(index: Int, height: Int)] = []
let N = Int(readLine()!)!
let input = readLine()!.split{$0==" "}.map{Int(String($0))!}

for i in 0..<N {
    while !stack.isEmpty && stack.last!.height < input[i] {
        stack.popLast()
    }
    if stack.isEmpty {print(0, terminator: " ")}
    else {print(stack.last!.index + 1, terminator: " ")}
    stack.append((i,input[i]))
}