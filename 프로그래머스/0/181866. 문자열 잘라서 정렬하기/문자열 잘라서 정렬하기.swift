import Foundation

func solution(_ myString:String) -> [String] {
    var list = myString.split{$0=="x"}.map{String($0)}
    return list.sorted(by:<)
}