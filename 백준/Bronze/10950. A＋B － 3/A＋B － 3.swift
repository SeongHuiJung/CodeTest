import Foundation

let N = Int(readLine()!)!
for i in 0..<N {
    let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
    print(input[0] + input[1])
}