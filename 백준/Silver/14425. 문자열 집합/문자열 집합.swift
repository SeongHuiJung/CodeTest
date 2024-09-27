let NM = readLine()!.split{$0==" "}.map{Int(String($0))!}
let N = NM[0]
let M = NM[1]
var count = 0
var set : Set<String> = []
for i in 0..<N {
    set.insert(readLine()!)
}

for i in 0..<M {
    if set.contains(readLine()!) == true {
        count += 1
    }
}
print(count)