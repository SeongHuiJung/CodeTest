let N = Int(readLine()!)!
for i in 0..<N {
    let line = readLine()!.split{$0==" "}.map{Int(String($0))!}
    let n = line[0]
    let m = line[1]
    print("Case #\(i + 1): \(n + m)")
}