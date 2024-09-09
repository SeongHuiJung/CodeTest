import Foundation

let priority = [
"*" : 2, "/" : 2,
"-" : 1, "+" : 1]


struct Stack {
    var list = [String]()
    
    mutating func push(data: String) {
        list.append(data)
    }
    
    mutating func pop() -> String {
        return list.popLast()!
    }
}

let input = String(readLine()!)
var stack = Stack()
let operatorList : [String] = ["+", "-", "*", "/", "(", ")"]

for c in input {
    // 피연산자 (A,B,C...)
    if !operatorList.contains(String(c)) {
        print(c, terminator: "")
    }
    
    // 연산자
    else {
        if String(c) == "(" {
            stack.push(data: String(c))
        }
        else if String(c) == ")" {
            while(!stack.list.isEmpty && stack.list.last != "(") {
                print(stack.pop(),terminator: "")
            }
            // )까지 제거
            stack.pop()
        }
        else {
            // 새로 들어온 연산자가 바로 앞전의 연산자보다 우선순위가 같거나 낮은 경우 -> 스택 내용물 모두 pop
            // 스택 내용물 모두 pop 이 아닌 top 하나만 제거해야함
            if !stack.list.isEmpty {
                if stack.list.last != "(" {
                    while (!stack.list.isEmpty && stack.list.last != "(" && priority[String(stack.list.last!)]! >= priority[String(c)]!) {
                        print(stack.pop(),terminator: "")
                    }
                }
            }
            stack.push(data: String(c))
        }
    }
}

while(!stack.list.isEmpty) {
    print(stack.pop(),terminator: "")
}

