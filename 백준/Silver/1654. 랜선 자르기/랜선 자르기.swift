let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let K = input[0]
let N = input[1]
var list = [Int]()
for i in 0..<K {
    let tmp = Int(readLine()!)!
    list.append(tmp)
}
list.sort(by:<)

var cnt = 0

var start = 1
var end = list.max()!
var mid = 0

var max = 0

while(start <= end) {
    cnt = 0
    mid = (start + end) / 2
    
    for line in list {
        cnt += line / mid
    }
    if cnt >= N {
        if max < mid {
            max = mid
        }
        
        if start == end { break }
        start = mid + 1
    }
    else {
        if start == end { break }
        end = mid - 1
    }
}
print(max)

