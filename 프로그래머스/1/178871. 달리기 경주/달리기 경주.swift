import Foundation

func solution(_ players:[String], _ callings:[String]) -> [String] {
    var result = players
    var dic: [String:Int] = [:]
    for i in 0..<players.count {
        dic[players[i]] = i + 1
    }
    
    for name in callings {
        dic[name]! -= 1
        let rank = dic[name]!
        let frontRunner = result[rank-1]
        dic[frontRunner]! += 1
        
        result.swapAt(rank - 1,rank)
    }
    
    
    return result
}

