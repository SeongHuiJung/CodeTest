import Foundation

struct Stack {
    var items : [Double] = []
    
    mutating func push (_ item : Double) {
        self.items.append(item)
    }
    
    mutating func pop () -> Double {
        return self.items.popLast()!
    }
    
    mutating func top () -> Double {
        if items.count != 0 {
            return self.items.last!
        }
        return -1
    }
    
    mutating func count() -> Int {
        return items.count
    }
    
    mutating func clear() {
        items.removeAll()
    }
}

let N = Int(readLine()!)!
let input = readLine()!
var list = [Double](repeating: 0, count: N)
for i in 0..<N {
    list[i] = Double(readLine()!)!
}
var stack = Stack()

for c in input {
    // 피연산자 인 경우
    if c != "*" && c != "/" && c != "-" && c != "+" {
        stack.push(list[Int(c.asciiValue!) - 65])
    }
    
    // 연산자
    else {
        let value1 = stack.pop()
        let value2 = stack.pop()
    
        switch c {
        case "*" :
            stack.push(value2 * value1)
        case "/" :
            stack.push(value2 / value1)
        case "+" :
            stack.push(value2 + value1)
        case "-" :
            stack.push(value2 - value1)
        default :
            break
        }
    }
}
print(String(format: "%.2f" , stack.pop()))

