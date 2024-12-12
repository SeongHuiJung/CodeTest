let NM = readLine()!.split{$0==" "}.map{Int(String($0))!}
let N = NM[0]
let M = NM[1]

if N < M {
    print("<")
}
else if N > M {
    print(">")
}
else { print("==") }
