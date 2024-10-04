import Foundation

func solution(_ citations:[Int]) -> Int {
    var list = citations.sorted(by:<)
    let min = list.min()!
    let max = list.max()!
    
    var cnt = 0
    for i in 1...list.count {
        for j in 0..<list.count {
            if list[j] >= i {
                cnt += 1
            }
        }
        if cnt < i {
            return i - 1
        }
        cnt = 0
    }
    return list.count
}

//100 101 102 103 104