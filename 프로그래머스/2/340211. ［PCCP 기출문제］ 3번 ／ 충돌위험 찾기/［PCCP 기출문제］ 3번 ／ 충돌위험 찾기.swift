import Foundation

func solution(_ points:[[Int]], _ routes:[[Int]]) -> Int {
    var route = routes // 남은 루트
    var position = [[Int]]() // 현재 위치
    var result = 0 // 겹치는 지점 총 회수
    
    for i in 0..<route.count {
        position.append(points[route[i][0] - 1])
        //route[i].remove(at: 0)
    }
    
    // 스타트 포인트에서 겹치는 로봇 체크
    var list = [[Int]](repeating: [Int](repeating:0, count: 101), count: 101)
    for i in 0..<position.count {
        list[position[i][0]][position[i][1]] += 1
    }
    for i in 0..<101 {
        for j in 0..<101 {
            if list[i][j] >= 2 {
                result += 1
            }
        }
    }
    
    // 첫번째 목표지점(스타트 지역) 삭제
    for i in 0..<route.count {
        route[i].remove(at: 0)
    }
    
     // 한칸 이동 하는 함수
    func move(robotIdx: Int) {
       let destinationY = points[route[robotIdx][0] - 1][0]
       let destinationX = points[route[robotIdx][0] - 1][1]
       
       if position[robotIdx][0] > destinationY {
           position[robotIdx][0] -= 1
       }
       else if position[robotIdx][0] < destinationY {
           position[robotIdx][0] += 1
       }
       else if position[robotIdx][1] > destinationX {
           position[robotIdx][1] -= 1
       }
       else if position[robotIdx][1] < destinationX {
           position[robotIdx][1] += 1
       }
    }
    
    // 포인트 도달 시 포인트 삭제 및 로봇 삭제
    func removeDestination(robotIdx: Int) -> Bool{
        let destinationY = points[route[robotIdx][0] - 1][0]
        let destinationX = points[route[robotIdx][0] - 1][1]
        
        // 포인트 도착
        if destinationY == position[robotIdx][0] && destinationX == position[robotIdx][1] {
            route[robotIdx].remove(at:0)
            // 모든 포인트에 도달함. 로봇 제거
            if route[robotIdx].count == 0 {
                route.remove(at:robotIdx)
                position.remove(at:robotIdx)
                return true
            }
        }
        return false
    }
    
    while(route.count > 1) {
        // 모든 로봇이 한번씩 움직이는 사이클 시작
        for i in 0..<route.count {
            move(robotIdx: i)
        }
        
        // 겹치는 로봇 체크
        var list = [[Int]](repeating: [Int](repeating:0, count: 101), count: 101)
        for i in 0..<position.count {
            list[position[i][0]][position[i][1]] += 1
        }
        for i in 0..<101 {
            for j in 0..<101 {
                if list[i][j] >= 2 {
                    result += 1
                }
            }
        }
        
        // 포인트에 도착한 로봇은 포인트 삭제
        var tmpIdx = 0
        while tmpIdx < position.count {
            if removeDestination(robotIdx: tmpIdx) {
                tmpIdx -= 1
            }
            tmpIdx += 1
        }
    }
    return result
}
