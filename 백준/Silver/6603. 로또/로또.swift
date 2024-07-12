import Foundation
var S = [Int]()
var result = [Int](repeating: 0, count: 6)
var first = 0
func read()-> [Int] {
    return readLine()!.split{$0==" "}.map{Int(String($0))!}
}

while(true) {
    S = read()
    first = S.removeFirst()
    if first == 0 {
        break
    }
    dfs(0,0)
    print("")
}

func dfs(_ start: Int,_ depth: Int){
    if depth == 6 {
        print(result.map{String($0) + " "}.reduce("", +))
        return
    }
    for i in start..<S.count {
        // depth 층(깊이) 일때 올 수 있는 값들을 for 문을 돌며 넣어야함
        result[depth] = S[i]
        dfs(i+1, depth+1)
    }
}