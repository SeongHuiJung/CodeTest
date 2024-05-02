import Foundation
var input = Int(readLine()!)!
var inputList = [Int]()
for i in 0...input-1 {
    inputList.append(Int(readLine()!)!)
}
 
var value = [Int](repeating: 0, count: 11)

value[0] = 1
value[1] = value[0] + 1
value[2] = value[0] + value[1] + 1

for i in 3...10 {
    value[i] = value[i-1] + value[i-2] + value[i-3]
}

for i in 0...input-1 {
    print(value[inputList[i]-1])
}
