import Foundation

let N = Int(readLine()!)!
var list = [[Int]](repeating: [], count: N)

for i in 0..<N {
    let str = readLine()!
    for s in str {
        list[i].append(Int(String(s))!)
    }
}

quad(x: 0, y: 0, size: N)

func quad(x: Int, y: Int, size: Int) {
    let first = list[x][y]
    
    if size == 1 {
        print(first, terminator: "")
        return
    }
    
    for i in x..<x + size {
        for j in y..<y + size {
            if first != list[i][j] {
                print("(", terminator: "")
                quad(x: x, y: y, size: size / 2)
                quad(x: x, y: y + size / 2, size: size / 2)
                quad(x: x + size / 2, y: y, size: size / 2)
                quad(x: x + size / 2, y: y + size / 2, size: size / 2)
                print(")", terminator: "")
                return
            }
        }
    }
    
    print(first, terminator: "")
}
