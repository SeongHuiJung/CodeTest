import Foundation

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    var reportList = [[String]]() // [["muzi", "frodo"], ["appee","fordo"]]
    var set : [Set<String>] = []
    var dic : [String:Set<String>] = [:] // 나를 신고한 dic
    var reportCount = [Int](repeating: 0, count: id_list.count)
    
    // set, dic 설정
    for i in 0..<id_list.count {
        set.append(Set<String>())
        dic[id_list[i]] = set[i]
    }
    
    // report split
    for str in report {
        let splitStr = str.split{$0==" "}.map{String($0)}
        reportList.append(splitStr)
    }
    
    // 신고자수 집계
    var tmp = Set<String>()
    for i in 0..<reportList.count {
        tmp = dic[reportList[i][1]]!
        tmp.insert(reportList[i][0])
        dic[reportList[i][1]]!.insert(reportList[i][0])
    }
    
    for str in id_list {
        if dic[str]!.count >= k {
            for c in dic[str]! { // c 는 메일 받을 사람
                // c 가 몇번째 id 인지 확인하고 카운트 1 추가
                for i in 0..<id_list.count {
                    if c == id_list[i] {
                        reportCount[i] += 1
                        break
                    }
                }
            }
        }
    }
    return reportCount
}
