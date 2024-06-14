var N = Int(readLine()!)!
var list = [Int]()
while(N >= 2) {
	list.append(N % 2)
	N = N / 2
}
list.append(N)
var cnt = 0
var result = [Int]()
for i in 0...list.count-1 {
	if list[i] == 1 {
		cnt += 1
		result.append(i)
	}
}
print(cnt)
for i in 0...result.count-1 {
	print("\(result[i]) ", terminator: "")
}