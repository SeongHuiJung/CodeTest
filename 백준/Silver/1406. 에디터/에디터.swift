var left = Array(readLine()!)
var right = [Character]()

let N = Int(readLine()!)!

for i in 0..<N {
    var cmd = readLine()!
    switch cmd {
    case "L" :
        if left.isEmpty == false {
            right.append(left.removeLast())
        }
    case "D" :
        if right.isEmpty == false {
            left.append(right.removeLast())
        }
    case "B" :
        if left.isEmpty == false {
            left.removeLast()
        }
    default:
        left.append(cmd.last!)
    }
}

print(String(left + right.reversed()))

