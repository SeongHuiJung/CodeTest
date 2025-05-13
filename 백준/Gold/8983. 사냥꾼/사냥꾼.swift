import Foundation

let MNL = readLine()!.split{$0==" "}.map{Int(String($0))!}
let M = MNL[0] // 사수 개수
let N = MNL[1] // 동물수
let L = MNL[2] // 사정거리
var animal = [[Int]](repeating: [], count: N)
var gunPosition = readLine()!.split{$0==" "}.map{Int(String($0))!}
for i in 0..<N {
    animal[i] = readLine()!.split{$0==" "}.map{Int(String($0))!}
}

gunPosition.sort(by:<)

let max = M - 1
var cnt = 0

for i in 0..<N {
    let scopeLeft = animal[i][0] + animal[i][1] - L
    let scopeRight = animal[i][0] - animal[i][1] + L
    
    var left = 0
    var right = max
    while(left <= right) {
        let mid = (left + right) / 2
        
        if gunPosition[mid] > scopeRight { right = mid - 1 }
        else if gunPosition[mid] < scopeLeft { left = mid + 1 }
        else {
            cnt += 1
            break
        }
    }
}
print(cnt)
