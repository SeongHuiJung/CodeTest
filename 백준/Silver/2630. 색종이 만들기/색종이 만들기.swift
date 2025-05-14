import Foundation

let N = Int(readLine()!)!
var list = [[Int]](repeating: [], count: N)

for i in 0..<N {
    list[i] = readLine()!.split{$0==" "}.map{Int(String($0))!}
}

var white = 0
var blue = 0

checkSameColor(x: 0, y: 0, size: N)

func checkSameColor(x: Int, y: Int, size: Int) {
    let first = list[x][y]
    
    if size == 1 {
        if first == 0 { white += 1 }
        else { blue += 1 }
        return
    }
    
    come: for i in x..<x + size {
        for j in y..<y + size {
            if first != list[i][j] {
                checkSameColor(x: x, y: y, size: size / 2)
                checkSameColor(x: x, y: y + size / 2, size: size / 2)
                checkSameColor(x: x + size / 2, y: y, size: size / 2)
                checkSameColor(x: x + size / 2, y: y + size / 2, size: size / 2)
                
                return
            }
        }
    }
    
    if first == 0 { white += 1 }
    else { blue += 1 }
}

print(white)
print(blue)
