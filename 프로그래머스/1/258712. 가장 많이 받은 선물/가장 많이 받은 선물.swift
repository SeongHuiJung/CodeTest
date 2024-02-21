import Foundation

func solution(_ friends:[String], _ gifts:[String]) -> Int {
    let friendsNum = friends.count
    let giftNum = gifts.count
    var giftRecord = [[Int]](repeating: [Int](repeating: 0, count: friendsNum), count: friendsNum)
    var giftScore = [Int](repeating: 0, count: friendsNum)
    var gift = [Int](repeating: 0, count: friendsNum)
    
    for i in 0...giftNum-1 {
        parsing(gift_record: &giftRecord, friends: friends, str: gifts, friendsNum: friendsNum, giftNum: i)
    }
    
    setGiftScore(giftRecord: giftRecord, giftScore: &giftScore, studentNum: friendsNum)
    
    for i in 0...friendsNum-1 {
        for j in i...friendsNum-1 {
            //자기 자신은 제외
            if (i != j) {
                if (giftRecord[i][j] > giftRecord[j][i]) {
                    //받을 선물 증가
                    gift[i] += 1
                }
                else if (giftRecord[i][j] < giftRecord[j][i]) {
                    gift[j] += 1
                }
                
                //선물 준 개수가 같거나, 서로 아예 주지 않았을 때
                else if (giftRecord[i][j] == giftRecord[j][i]){
                    //선물 지수가 더 높은 사람이 선물을 받음. 선물 지수가 같다면 둘 다 선물을 주고 받지 않게 함
                    if (giftScore[i]<giftScore[j]) {
                        gift[j] += 1
                    }
                    else if (giftScore[i]>giftScore[j]) {
                        gift[i] += 1
                    }
                }
            }
        }
    }
    gift.sort()
    return gift.last!
}


func parsing( gift_record : inout [[Int]], friends:[String], str:[String], friendsNum: Int, giftNum: Int) {
    let splitList = str[giftNum].description.components(separatedBy: " ")
    var giver : Int = 0
    var receiver : Int = 0
    
    for i in 0...friendsNum {
        if (friends[i] == String(splitList[0])) {
            giver = i
            break
        }
    }
    
    for i in 0...friendsNum {
        if (friends[i] == String(splitList[1])) {
            receiver = i
            break
        }
    }
    gift_record[giver][receiver] += 1
}

func setGiftScore(giftRecord : [[Int]], giftScore : inout [Int], studentNum : Int) {
    for i in 0...studentNum-1 {
        giftScore[i] = getGaveCount(giftRecord: giftRecord, idx: i, studentNum: studentNum) - getReceivedCount(giftRecord: giftRecord, idx: i, studentNum: studentNum)
    }
}


func getGaveCount (giftRecord : [[Int]],idx : Int , studentNum : Int) ->Int {
    var cnt = 0
    for i in 0...studentNum-1 {
        cnt += giftRecord[idx][i]
    }
    return cnt
}

func getReceivedCount (giftRecord : [[Int]],idx : Int , studentNum : Int) ->Int {
    var cnt = 0
    for i in 0...studentNum-1 {
        cnt += giftRecord[i][idx]
    }
    return cnt
}