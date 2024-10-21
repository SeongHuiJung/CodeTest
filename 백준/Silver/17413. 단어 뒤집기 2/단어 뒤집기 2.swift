let input = readLine()!
var stack = [String]()
var word = [String]()

for c in input {
    if stack.isEmpty {
        
        // 태그시작
        if c == "<" {
            if !word.isEmpty {
                print(String(word.reduce("", { $0 + $1 }).reversed()),terminator: "")
                word.removeAll()
            }
            
            stack.append(String(c))
            print(String(c),terminator: "")
        }
        // 단어
        else {
            if String(c) == " "{
                print(String(word.reduce("", { $0 + $1 }).reversed()),terminator: "")
                print(String(c),terminator: "")
                word.removeAll()
            }
            else {
                word.append(String(c))
            }
        }
    }
    // 태그중간~태그끝
    else {
        print(String(c), terminator: "")
        if String(c) == ">" {
            stack.popLast()
        }
    }
}

if !word.isEmpty {
    print(String(word.reduce("", { $0 + $1 }).reversed()),terminator: "")
}
