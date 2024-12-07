import Foundation

let N = Int(readLine()!)!
let M = Int(readLine()!)!

let a = M / 100
let b = (M - a * 100) / 10
let c = M - a * 100 - b * 10

print(N * c)
print(N * b)
print(N * a)
print(N * M)
