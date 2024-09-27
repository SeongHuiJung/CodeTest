let N = Int(readLine()!)!
if N <= 1 {
    print(N == 0 ? 0 : 1)
}
else {
    var list = [Int](repeating: 0, count: N + 1)
    list[0] = 0
    list[1] = 1
    for i in 2...N {
        list[i] = list[i-1] + list[i-2]
    }
    print(list[N])
}