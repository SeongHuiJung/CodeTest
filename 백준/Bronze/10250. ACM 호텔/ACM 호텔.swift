import Foundation

let testcase = Int(readLine()!)!
for _ in 0..<testcase {
    let HWN = readLine()!.split{$0==" "}.map{Int(String($0))!}
    let H = HWN[0]
    let W = HWN[1]
    let N = HWN[2]
    
    var height = N % H
    var line = N / H + 1
    if height == 0 {
        height = H
        line -= 1
    }
    print(height * 100 + line)
}