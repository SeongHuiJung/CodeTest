import Foundation
let N = Int(readLine()!)!
let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
var max = input[0]
var min = input[0]
for i in 1..<N {
    if max < input[i] {
        max = input[i]
    }
    if min > input[i] {
        min = input[i]
    }
}
print(min, max)