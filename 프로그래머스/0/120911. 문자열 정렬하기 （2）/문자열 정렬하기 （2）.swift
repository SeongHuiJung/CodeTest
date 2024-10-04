import Foundation

func solution(_ my_string:String) -> String {
    var str = ""
    for c in my_string{
        if c >= "A" && c <= "Z" {
            str.append(c.lowercased())
        }
        else {str.append(c)}
    }
    
    return String(Array(str).sorted {$0<$1})
}