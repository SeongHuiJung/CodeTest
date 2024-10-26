import Foundation
func solution(_ targets:[[Int]]) -> Int {
    var list = targets.sorted{$0[1] < $1[1]}
    var end = list[0][1]
    var answer = 0
    
    for target in list {
        if target[0] >= end {
            end = target[1]
            answer += 1
        }
    }
    return answer + 1
}
