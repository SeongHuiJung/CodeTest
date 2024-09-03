let n = Int(readLine()!)!
var numArr = [[Character]]()
var scoreArr = [(Int, Int)]()

for _ in 0..<n {
  let input = readLine()!.split(separator: " ")
  let num = Array(input[0])
  let s = Int(input[1])!
  let b = Int(input[2])!
  numArr.append(num)
  scoreArr.append((s, b))
}

func checkScore(_ target: [Character], _ num: [Character]) -> (Int, Int) {
  var sScoer = 0
  var bScoer = 0
  
  for i in 0..<3 {
    if !target.contains(num[i]) { continue }
    if i == target.firstIndex(of: num[i]) {
      sScoer += 1
    } else {
      bScoer += 1
    }
  }
  return (sScoer, bScoer)
}

func checkNum(target: [Character]) -> Bool {
  for i in 0..<n {
    let score = checkScore(target, numArr[i])
    if score != scoreArr[i] { return false }
  }
  return true
}

var result = [[Character]]()
 
for i in 123...987 {
  let a = Array(String(i))
  if !a.contains("0") && a[0] != a[1] && a[0] != a[2] && a[1] != a[2] {
    if checkNum(target: a) {
      result.append(a)
    }
  }
}

print(result.count)