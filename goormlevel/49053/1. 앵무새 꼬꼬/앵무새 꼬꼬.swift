let N = Int(readLine()!)!
for _ in 0...N-1 {
	let input = String(readLine()!)
	var flag = 0
	for c in input {
		if c == "a" || c == "e" || c == "i" || c == "o" || c == "u" || c == "A" || c == "E" || c == "I" || c == "O" || c == "U" {
			print(c, terminator : "")
			flag = 1
		}
	}
	if flag == 0 {
		print("???")
	}
	else {
		print("")
	}
}
