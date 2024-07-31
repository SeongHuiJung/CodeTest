import Foundation
let N = Int(readLine()!)!
var sum = 1
var i = 1
while (true) {
    if sum < N {
        sum += 6 * i
    }
    else{
        break
    }
    i += 1

}
print(i)