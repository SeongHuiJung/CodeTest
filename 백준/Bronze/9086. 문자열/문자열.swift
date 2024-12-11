import Foundation

let N = Int(readLine()!)!
for i in 0..<N {
    let str = readLine()!
    if str.count > 1 {
        print(str[0]+str[str.count - 1])
    }
    else {
        print(str[0]+str[0])
    }
}

extension String {
    subscript(_ index: Int) -> String {
        return String(self[self.index(self.startIndex, offsetBy: index)])
    }
}