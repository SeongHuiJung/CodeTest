import Foundation
let pad = [[1,2,3],[4,5,6],[7,8,9],[10,0,10]]
var currentL : Int = 9
var currentR : Int = 11
var result : String = ""

func solution(_ numbers:[Int], _ hand:String) -> String {
    for i in 0...numbers.count-1 {
        if numbers[i] == 2 || numbers[i] == 5 || numbers[i] == 8 || numbers[i] == 0 {
            var location = numbers[i]-1
            if (location == -1) {
                location = 10
            }
            // 2,5,8,0 인 경우
            // 왼손, 오른손 현재 위치로부터 키패드까지의 거리 구하는 함수

            if distance(current: currentL, key: location) > distance(current: currentR, key: location) {
                
                //오른손으로 누르기
                result.append("R")
                currentR = location
            }
            else if distance(current: currentL, key: location) < distance(current: currentR, key: location) {
                //왼손으로 누르기
                result.append("L")
                currentL = location
            }
            else {
                if (hand == "left") {
                    result.append("L")
                    currentL = location
                }
                else {
                    result.append("R")
                    currentR = location
                }
            }
        }
        
        else if numbers[i] == 1 || numbers[i] == 4 || numbers[i] == 7 {
            result.append("L")
            currentL = numbers[i]-1
        }
        
        else {
            result.append("R")
            currentR = numbers[i]-1
        }
    }
    return result
}

func distance(current: Int, key : Int) -> Int {
    let currentX = current / 3
    let currentY = current % 3
    let keyX = key / 3
    let keyY = key % 3
    
    var x = currentX-keyX
    var y = currentY-keyY
    
    if x < 0 {
        x = -x
    }
    if y < 0 {
        y = -y
    }
    
    return x+y
}


