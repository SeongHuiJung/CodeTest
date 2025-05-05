import Foundation

let testcase = Int(readLine()!)!

nextTestCase: for _ in 0..<testcase {
    let _ = Int(readLine()!)!
    var coinList = readLine()!.split{$0 == " "}.map{Int(String($0))!}
    let target = Int(readLine()!)!
    
    for i in 0..<coinList.count {
        if coinList[i] > target {
            coinList = Array(coinList[..<i])
            break
        }
    }
    
    if coinList.isEmpty {
        print(0)
        break nextTestCase
    }

    var DP = [Int](repeating: 0, count: target + 1)
    // 초기값 세팅
    DP[0] = 1
    
    dpFunc(DP: &DP, coinList: coinList, target: target)
    print(DP[target])
}

func dpFunc(DP: inout [Int], coinList: [Int] ,target: Int) {
    for coin in coinList {
        for i in coin...target {
            if DP[i - coin] > 0 {
                DP[i] += DP[i - coin]
            }
        }
    }
}
