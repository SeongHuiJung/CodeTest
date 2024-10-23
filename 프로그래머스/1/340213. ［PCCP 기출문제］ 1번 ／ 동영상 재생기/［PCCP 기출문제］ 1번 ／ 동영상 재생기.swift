import Foundation

func solution(_ video_len:String, _ pos:String, _ op_start:String, _ op_end:String, _ commands:[String]) -> String {
    let videoTotalLen = video_len.split{$0==":"}.map{Int($0)!}
    var posTime = pos.split{$0==":"}.map{Int($0)!}
    let opStartTime = op_start.split{$0==":"}.map{Int($0)!}
    let opEndTime = op_end.split{$0==":"}.map{Int($0)!}
    
    func checkOpening() {
        if (opStartTime[0] * 60 + opStartTime[1]) <= (posTime[0] * 60 + posTime[1]) && (posTime[0] * 60 + posTime[1]) <= (opEndTime[0] * 60 + opEndTime[1])  {
        posTime[0] = opEndTime[0]
        posTime[1] = opEndTime[1]
        }
    }
    
    // 현재 타임이 오프닝 사이에 있는 경우
    checkOpening()
    
    
    for cmd in commands {
        if cmd == "next" {
            if (videoTotalLen[0] * 60 + videoTotalLen[1]) - (posTime[0] * 60 + posTime[1]) <= 10 {
                posTime[0] = videoTotalLen[0]
                posTime[1] = videoTotalLen[1]
            }
            else {
                posTime[1] += 10
                posTime[0] += posTime[1] / 60
                posTime[1] = posTime[1] % 60
            }
        }
        else {
            if  posTime[0] * 60 + posTime[1] <= 10 {
                posTime[0] = 0
                posTime[1] = 0
            }
            else { 
                posTime[1] -= 10
                if posTime[1] < 0 {
                    posTime[1] += 60
                    posTime[0] -= 1
                }
            }
        }
        checkOpening()
    }
    
    var result = ""
    if posTime[0] < 10 {result += "0"}
    result += String(posTime[0]) + ":"
    
    if posTime[1] < 10 {result += "0"}
    result += String(posTime[1])
    
    return result
}

