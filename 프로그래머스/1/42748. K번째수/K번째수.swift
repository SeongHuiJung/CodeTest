import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    var result = [Int]()
    var list = [Int]()
    for i in 0..<commands.count {
        let cmd = commands[i]
        for j in cmd[0]...cmd[1] {
            list.append(array[j-1])
        }
        result.append(list.sorted(by:<)[cmd[2]-1])
        list.removeAll()
    }
    return result
}