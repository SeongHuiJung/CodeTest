import Foundation

func solution(_ numlist:[Int], _ n:Int) -> [Int] {    
    return numlist.sorted(by:>).sorted{
        abs($0-n) < abs($1-n)
    }
}