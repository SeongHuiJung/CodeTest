
import Foundation
var input = readLine()!.split(separator: " ").map { Int(String($0))! }

print(input[0]+input[1])
print(input[0]-input[1])
print(input[0]*input[1])
print(input[0]/input[1])
print(input[0]%input[1])
