import Foundation

func solution(_ park:[String], _ routes:[String]) -> [Int] {
    var list = [[String]]()
    for str in park {
        list.append(str.map{ String($0) })
    }
    
    var posY = 0
    var posX = 0
    
    func checkObject(_ list: [[String]], _ posY: Int, _ posX: Int, _ direction: String, _ length: Int) -> Bool { 
        if direction == "N" {
            for i in 1...length {
                // 장애물 발견
                if list[posY-i][posX] == "X" {
                    return false
                }
            }
        }
        else if direction == "S" {
            for i in 1...length {
                // 장애물 발견
                if list[posY+i][posX] == "X" {
                    return false
                }
            }
        }
        else if direction == "W" {
            for i in 1...length {
                // 장애물 발견
                if list[posY][posX-i] == "X" || posX - length < 0 {
                    return false
                }
            }
        }
        else if direction == "E" {
            for i in 1...length {
                // 장애물 발견
                if list[posY][posX+i] == "X" || posX + length >= list[0].count {
                    return false
                }
            }
        }
        return true
    }
    
    // 시작위치 찾기
    for i in 0..<list.count {
        for j in 0..<list[0].count {
            if list[i][j] == "S" {
                posY = i
                posX = j
            }
        }
    }
    
    for cmd in routes {
        let input = cmd.split{$0==" "}.map{String($0)}
        let direction = input[0]
        let length = Int(input[1])!
        
        if direction == "N" && posY - length >= 0 {
            if checkObject(list, posY, posX, direction, length) {
                posY -= length
            }
        }
        else if direction == "S" && posY + length < list.count {
            if checkObject(list, posY, posX, direction, length) {
                posY += length
            }
        }
        else if direction == "W" && posX - length >= 0 {
            if checkObject(list, posY, posX, direction, length) {
                posX -= length
            }
        }
        else if direction == "E" && posX + length <= list[0].count {
            if checkObject(list, posY, posX, direction, length) {
                posX += length
            }
        }
    }
    
    return [posY,posX] 
}