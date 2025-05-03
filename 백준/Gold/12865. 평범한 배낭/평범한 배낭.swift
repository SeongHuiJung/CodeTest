import Foundation

let input = readLine()!.split{ $0 == " " }.map{Int(String($0))!}
let N = input[0] // 물건개수
let K = input[1] // 넣을 수 있는 최대무게

// DP[i][K] : K무게까지 담을 수 있고, 1~i까지의 아이템을 고려했을 때 최대 가치
var DP = [[Int]](repeating: [Int](repeating: 0, count: 100001), count: 101)
var W = [Int](repeating: 0, count: 101)
var V = [Int](repeating: 0, count: 101)

for i in 0..<N {
    let input = readLine()!.split{ $0 == " " }.map{Int(String($0))!}
    W[i + 1] = input[0]
    V[i + 1] = input[1]
}

func dp() {
    for limit in 1...K { // limit 는 최대무게
        for i in 1...N {
            // 물건을 넣을 수 있는 무게
            if W[i] <= limit {
                DP[i][limit] = max(DP[i - 1][limit], V[i] + DP[i - 1][limit - W[i]])
            }
            else {
                DP[i][limit] = DP[i - 1][limit]
            }
        }
    }
}

dp()

print(DP[N][K])
