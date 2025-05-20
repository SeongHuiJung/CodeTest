import Foundation

let N = Int(readLine()!)!

if N % 400 == 0 {
    print(1)
}
else {
    if N % 100 != 0 && N % 4 == 0 {
        print(1)
    }
    else { print(0) }
}
