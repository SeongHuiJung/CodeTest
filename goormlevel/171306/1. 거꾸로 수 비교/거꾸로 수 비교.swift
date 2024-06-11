import Foundation
var input = readLine()!.split(separator: " ")
let str : String
let str2 : String
str = String(input[0].reversed())
str2 = String(input[1].reversed())


if Int(str)! < Int(str2)! {
	print(input[1])
}
else {
	print(input[0])
}