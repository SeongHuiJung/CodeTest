import Foundation

let N = Int(readLine()!)!
let M = Int(readLine()!)!

var map = [[Int]](repeating: [Int](repeating: 100000 * N + 1, count: N), count: N)

for i in 0..<M {
    let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
    let u = input[0] - 1
    let v = input[1] - 1
    let cost = input[2]
    if map[u][v] > cost {
        map[u][v] = cost
    }
}

for k in 0..<N {
    for i in 0..<N {
        for j in 0..<N {
            if map[i][k] + map[k][j] < map[i][j] && i != j{
                map[i][j] = map[i][k] + map[k][j]
            }
        }
    }
}

for i in 0..<N {
    print(map[i].map{String($0 == 100000 * N + 1 ? 0 : $0)}.joined(separator: " "))
}
