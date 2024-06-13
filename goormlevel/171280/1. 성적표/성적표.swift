let N = readLine()!.split(separator: " ").map{Int(String($0))!}
// [과목번호][총점수][시험본회수]
var score = [[Double]](repeating: [Double](repeating: 0.0, count: 3), count: N[1])
for i in 0...N[1]-1 {
    score[i][0] = Double(i)
}
for _ in 0...N[0]-1 {
    let input = readLine()!.split(separator: " ").map{Double(String($0))!}
    score[Int(input[0])-1][1] += input[1]
    score[Int(input[0])-1][2] += 1
}
for i in 0...N[1]-1 {
    if score[i][2] != 0 {
        score[i][1] = score[i][1]/score[i][2]
    }
}
score.sort(by: {$0[1]>$1[1]})
print(Int(score[0][0])+1)