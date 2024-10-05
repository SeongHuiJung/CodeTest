let input = Int(readLine()!)!

if input <= 7 {
    if input == 3 || input == 5 {
        print(1)
    }
    else if input == 4 || input == 7{
        print(-1)
    }
    else {
        print(2)
    }
}
else {
    var dp = [Int](repeating: 0, count: input + 1)
    // 초반값
    dp[3] = 1
    dp[4] = -1
    dp[5] = 1
    dp[6] = 2
    dp[7] = -1
    
    var case1 = 0
    var case2 = 0
    for i in 8...input {
        case1 = i - 3
        case2 = i - 5
        if dp[case1] == -1 || dp[case2] == -1 {
            if dp[case1] == -1 {
                dp[i] = 1 + dp[case2]
            }
            else {
                dp[i] = 1 + dp[case1]
            }
        }
        else {
            if dp[case1] < dp[case2] {
                dp[i] = 1 + dp[case1]
            }
            else {
                dp[i] = 1 + dp[case2]
            }
        }
        
    }
    print(dp[input])
}