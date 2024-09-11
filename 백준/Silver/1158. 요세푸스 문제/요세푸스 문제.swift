import Foundation
let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let N = input[0]
let K = input[1]
var pointer = K - 1
var array = Array(1...N)

print("<", terminator: "")
print(array.remove(at: pointer), terminator: "")

while(array.count > 1) {
    pointer = (pointer + K) % array.count - 1
    if pointer == -1 {pointer = array.count-1}
    print(", \(array.remove(at: pointer))", terminator: "")
}
if !array.isEmpty {print(", \(array[0])", terminator: "")}
print(">")