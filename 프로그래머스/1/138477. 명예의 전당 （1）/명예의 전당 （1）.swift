import Foundation

func solution(_ k:Int, _ score:[Int]) -> [Int] {
    var list = [Int]()
    var result = [Int]()
    var flag = 0
    list.append(score[0])
    result.append(score[0])
    for i in 1...score.count-1 {
        flag = 0
        for j in 0...i-1 {
            if list[j] < score[i] {
                list.insert(score[i],at: j)
                flag = 1
                break
            }
        }
        if flag == 0 {
            list.append(score[i])
        }
        
        if list.count < k {
            result.append(list.last!)
        }
        else {
            result.append(list[k-1])
        }
    }
    return result
}
