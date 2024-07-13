struct Stack {
    var items : [String] = []
    
    mutating func push (_ item : String) {
        self.items.append(item)
    }
    
    mutating func pop () -> String {
        return self.items.popLast()!
    }
    
    mutating func top () -> String {
        if items.count != 0 {
            return self.items.last!
        }
        return "none"
    }
    
    mutating func count() -> Int {
        return items.count
    }
    
    mutating func clear() {
        items.removeAll()
    }
}

let N = Int(readLine()!)!
var input = [""]
var stack = Stack()
var flag = false
for i in 0..<N {
    input = readLine()!.map{String($0)}
    flag = false
    stack.clear()
    for c in input {
        if c == "(" {
            stack.push(c)
        }
        else if c == ")" {
            // VPS
            if stack.top() == "(" {
                stack.pop()
            }
            // VPS 가 아님
            else {
                //print(stack.top())
                flag = true
                break
            }
        }
    }
    // 스택에 남아 있는 ( 가 있다면 VPS 가 아님
    if stack.top() != "none" {
        flag = true
    }
    
    //VPS X
    if flag == true {
        print("NO")
    }
    // VPS O
    else {
        print("YES")
    }
}