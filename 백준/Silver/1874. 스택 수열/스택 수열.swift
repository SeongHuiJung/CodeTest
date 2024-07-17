
struct Stack {
    var items = [Int]()
    mutating func push(item: Int) {
        self.items.append(item)
        result.append("+")
    }
    mutating func pop() {
        self.items.popLast()
        result.append("-")
    }
}

let N = Int(readLine()!)!

var result = [Character]()
var stack = Stack()
var list = [Int]()
var cnt = 1
for i in 0..<N {
    list.append(Int(readLine()!)!)
}
list.reverse()
var inputNum = 1
var flag = false
var cpr = 0

stack.push(item: inputNum)

while (!list.isEmpty) {
    cpr = list.popLast()!
    while (true) {
        // 1~N 숫자를 모두 스택에 넣었는지 체크
        if inputNum <= N {
            // 스택이 비어 있으면 무조건 push
            if stack.items.isEmpty {
                inputNum += 1
                stack.push(item: inputNum)
            }
            else if stack.items.last! < cpr {
                inputNum += 1
                stack.push(item: inputNum)
            }
            else if stack.items.last! == cpr {
                stack.pop()
                break
            }
            else {
                flag = true
                break
            }
        }
        else {
            if stack.items.last! == cpr {
                stack.pop()
            }
            else {
                flag = true
                break
            }
        }
    }
    if flag == true {
        break
    }
}

if flag == true {
    print("NO")
}
else {
    for i in 0..<result.count {
        print(result[i])
    }
}
