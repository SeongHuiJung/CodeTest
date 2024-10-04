func solution(_ s:String) -> Bool {
    if s.count != 4 && s.count != 6 {
        return false
    }
    
    for c in s {
        if c >= "a" && c <= "z" || c >= "A" && c <= "Z" {
            return false
        }
    }
    return true
}


