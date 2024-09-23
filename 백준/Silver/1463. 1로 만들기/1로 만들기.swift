import Foundation

let X = Int(readLine()!)!

if X <= 3 {
    switch X {
    case 1 : print("0")
    case 2 : print("1")
    case 3 : print("1")
    default : break
    }
}

else {
    var value = [Int](repeating: 0, count: X + 1)
    value[1] = 0 // X가 1
    value[2] = 1 // X가 2
    value[3] = 1 // X가 3
    for i in 4...X {
        value[i] = value[i-1] + 1
        if i % 3 == 0 {
            value[i] = min(value[i], value[i/3] + 1)
        }
        if i % 2 == 0 {
            value[i] = min(value[i],value[i/2] + 1)
        }
    }
    print(value[X])
}