import Foundation

let input = readLine()!.components(separatedBy: " ").map{Int(String($0))!}
var list = [[String]](repeating: [String](repeating:".", count: input[1]), count: input[0])
var flag = 1
for i in 0...input[0]-1 {
    for j in 0...input[1]-1 {
        if i % 2 == 0 {
            list[i][j] = "#"
        }
        else if j == 0 && flag == 0 {
            list[i][j] = "#"
            flag = 1
            break
        }
        else if j == input[1]-1 && flag == 1 {
            list[i][j] = "#"
            flag = 0
            break
        }
    }
}
for i in 0...input[0]-1 {
    for j in 0...input[1]-1 {
        print(list[i][j], terminator: "")
    }
    print("")
}
