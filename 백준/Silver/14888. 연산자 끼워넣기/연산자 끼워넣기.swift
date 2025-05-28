import Foundation

let N = Int(readLine()!)!
let number = readLine()!.split{$0==" "}.map{Int(String($0))!}
var operators = readLine()!.split{$0==" "}.map{Int(String($0))!}

var min = Int(1e9)
var max = Int(-1e9)

backtracking(n: 0, value: number[0])

print(max)
print(min)

func backtracking(n: Int, value: Int) {
    if n == N - 1 {
        if value > max { max = value }
        if value < min { min = value }
        return
    }
    
    if operators[0] != 0 {
        operators[0] -= 1
        backtracking(n: n + 1, value: value + number[n + 1])
        operators[0] += 1
    }
    
    if operators[1] != 0 {
        operators[1] -= 1
        backtracking(n: n + 1, value: value - number[n + 1])
        operators[1] += 1
    }
    
    if operators[2] != 0 {
        operators[2] -= 1
        backtracking(n: n + 1, value: value * number[n + 1])
        operators[2] += 1
    }
    
    if operators[3] != 0 {
        operators[3] -= 1
        backtracking(n: n + 1, value: value / number[n + 1])
        operators[3] += 1
    }
}