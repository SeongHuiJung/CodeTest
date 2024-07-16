struct Stack {
    var items = [Int]()
    mutating func push (item: Int) {
        self.items.append(item)
    }
    
    mutating func pop () -> Int {
        if size() != 0 {
            return self.items.popLast()!
        }
        return -1
    }
    
    mutating func size() -> Int {
        return self.items.count
    }
    
    mutating func empty() -> Int {
        if size() != 0 {
            return 0
        }
        return 1
    }
    
    mutating func top() -> Int {
        if size() != 0 {
            return self.items.last!
        }
        return -1
    }
}

var stack = Stack()
let N = Int(readLine()!)!
for i in 0..<N {
    let input = readLine()!.split{$0 == " "}.map{String($0)}
    if input.count == 1 {
        if input[0] == "pop" {
            print(stack.pop())
        }
        else if input[0] == "size" {
            print(stack.size())
        }
        else if input[0] == "empty" {
            print(stack.empty())
        }
        else if input[0] == "top" {
            print(stack.top())
        }
    }
    else {
        stack.push(item : Int(input[1])!)
    }
}
