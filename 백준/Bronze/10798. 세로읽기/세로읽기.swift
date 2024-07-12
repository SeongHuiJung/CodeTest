import Foundation
var str = [[String]](repeating: [String](repeating: "!", count: 15), count: 5)
for i in 0..<5 {
    str[i] = Array(readLine()!.map{String($0)})
}

for i in 0..<15 {
    for j in 0..<5 {
        if str[j].count > i {
            print(str[j][i], terminator: "")
        }
    }
}


extension String {
    subscript(_ index: Int) -> Character {
        return self[self.index(self.startIndex, offsetBy: index)]
    }
}