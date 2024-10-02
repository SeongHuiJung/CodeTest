import Foundation

func solution(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
    var result = [Int]()
    var dic: [String: Int] = [:]
    for i in 0..<terms.count {
        let termData = terms[i].split{$0==" "}.map{String($0)}
        dic[termData[0]] = Int(termData[1])!
    }
    
    
    for i in 0..<privacies.count {
        let privacyData = privacies[i].split{$0==" "}.map{String($0)} // [2021.05.02,A]
        var date = privacyData[0].split{$0=="."}.map{Int(String($0))!} // [2021,05,02]

        for j in dic {
            if privacyData[1] == j.key {
                date[1] += j.value
                if date[1] > 12 {
                    date[0] += (date[1] - 1) / 12
                    date[1] = date[1] % 12
                    if date[1] == 0 {date[1] = 12}
                }
            }
        }
        
        let resultDate = date[0] * 10000 + date[1] * 100 + date[2] // 20210502
        
        let todayList = today.split{$0=="."}.map{Int(String($0))!}
        let todayDate = todayList[0] * 10000 + todayList[1] * 100 + todayList[2]
        if resultDate <= todayDate {
            result.append(i + 1)
        }
    }
    return result
}

extension String{
    subscript(_ index: Int) -> String {
        return String(self[self.index(self.startIndex, offsetBy: index)])
    }
}
