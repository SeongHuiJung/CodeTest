import Foundation
let N = Int(readLine()!)!
if N >= 90 && N <= 100 {
    print("A")
}
else if N >= 80 && N < 90 {
    print("B")
}

else if N >= 70 && N < 80 {
    print("C")
}
else if N >= 60 && N < 70 {
    print("D")
}
else {
    print("F")
}
