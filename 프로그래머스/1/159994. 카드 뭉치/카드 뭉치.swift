import Foundation
func solution(_ cards1:[String], _ cards2:[String], _ goal:[String]) -> String {
    var set1 = cards1
    var set2 = cards2
    for i in 0...goal.count - 1 {
        if goal[i] == set1.first {
            set1.remove(at: 0)
        }
        else if goal[i] == set2.first {
            set2.remove(at: 0)
        }
        else {
            return "No"
        }
    }
    return "Yes"
}

