import Foundation
let N = Int(readLine()!)!
var cnt = 0
var flag = 0
for _ in 0...N-1 {
	let input = readLine()!.split(separator: " ")
	if input[0] == "in" {
		cnt += Int(input[1])!
	}
	else {
		cnt -= Int(input[1])!
	}
	
	if cnt < 0 {
		flag = 1
	}
}

if flag == 1 {
	print("fail")
}
else {
	print("success")
}