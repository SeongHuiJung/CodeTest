import Foundation
struct Stack {
    var list = [String]()
    
    mutating func push (_ input : String) {
        list.append(input)
    }
    
    mutating func pop () -> String {
        return list.popLast()!
    }
}

var stack = Stack()
var sum = 0
var isWrong = false
var lastChar = ""
let input = readLine()!
for c in input {
    if c == "(" || c == "[" {
        stack.push(String(c))
    }
    else {
        sum = 0
        while(stack.list.last != "(" && stack.list.last != "[") {
            if stack.list.last == nil {
                isWrong = true
                break
            }
            sum += Int(stack.pop())!
        }
        
        // ( or [ 제거
        if stack.list.isEmpty == true {
            isWrong = true
            break
        }
        lastChar = stack.pop()
        
        // 짝이 안맞으면 오류 처리
        guard lastChar == "(" && c == ")" || lastChar == "[" && c == "]" else {
            isWrong = true
            break
        }
        
        if sum == 0 {
            if c == ")" {
                stack.push(String(2))
            }
            else {
                stack.push(String(3))
            }
        }
        else {
            if c == ")" {
                stack.push(String(sum * 2))
            }
            else {
                stack.push(String(sum * 3))
            }
        }
    }
}
var stackOut = ""
if isWrong == true {
    print("0")
}
else {
    sum = 0
    while (!stack.list.isEmpty) {
        stackOut = stack.pop()
        if stackOut == "(" || stackOut == ")" || stackOut == "[" || stackOut == "]" {
            print("0")
            isWrong = true
            break
        }
        else {
            sum += Int(stackOut)!
        }
    }
    if isWrong == false {
        print(sum)
    }
}


