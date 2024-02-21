import Foundation

func solution(_ name:[String], _ yearning:[Int], _ photo:[[String]]) -> [Int] {
    var score = [Int](repeating: 0, count: photo.count)
    for i in 0...photo.count-1 {
        for j in 0...photo[i].count-1 {
            for k in 0...name.count-1 {
                if photo[i][j] == name[k] {
                    score[i] += yearning[k]
                    break
                }
            }
        }
    }
    return score
}