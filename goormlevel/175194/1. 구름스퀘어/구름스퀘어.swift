let N = Int(readLine()!)!
var timeList = [[Int]]()
for _ in 0...N-1 {
	let input = readLine()!.split(separator: " ").map{Int(String($0))!}
	timeList.append(input)
}

timeList.sort(by: {$0[1] < $1[1]})
//timeList.sort(by: {$0[0] < $1[0]})
var last_time = 0
var cnt = 0
for i in 0...timeList.count-1 {
	if last_time + 1 <= timeList[i][0] {
		cnt += 1
		last_time = timeList[i][1]
	}
}
print(cnt)