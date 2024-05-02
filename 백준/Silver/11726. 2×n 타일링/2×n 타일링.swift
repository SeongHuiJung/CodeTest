import Foundation
var input = Int(readLine()!)!
var value = [Int]()

value.append(1)
value.append(value[0]+1)
if input == 1 || input == 2{
    print(value[input-1])
}
else {
    for i in 2...input-1 {
        value.append((value[i-1]  + value[i-2])%10007 )
    }
    print(value[input-1])
}
