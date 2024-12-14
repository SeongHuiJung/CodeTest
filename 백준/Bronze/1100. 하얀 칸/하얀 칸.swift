var cnt = 0

for i in 0..<8 {
    let str = Array(readLine()!)
    for j in 0..<8 {
        if (i + j) % 2 == 0 && str[j] == "F" {
            cnt += 1
        }
    }
}

print(cnt)