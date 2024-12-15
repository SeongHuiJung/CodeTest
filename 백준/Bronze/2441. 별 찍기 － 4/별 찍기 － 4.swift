let N = Int(readLine()!)!
for i in 0..<N {
    for j in 0..<i {
        print(" ",terminator: "")
    }
    for j in stride(from: N - i, to: 0, by: -1) {
        print("*", terminator: "")
    }
    print("")
}