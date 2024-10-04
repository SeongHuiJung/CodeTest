import Foundation

func solution(_ my_string:String) -> [Int] {
    var list = [Int]()
    for c in my_string {
        if c >= "0" && c <= "9" {
            list.append(Int(String(c))!)
        }
    }
    return list.sorted(by:<)
}