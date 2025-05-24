import Foundation

struct Node {
    var left = ""
    var right = ""
}

let N = Int(readLine()!)!

var tree : [String : Node] = [:]

for i in 0..<N {
    let input = readLine()!.split{$0==" "}.map{String($0)}
    tree[input[0]] = Node(left: input[1], right: input[2])
}

preorder(str: "A")
print("")
inorder(str: "A")
print("")
postorder(str: "A")

func preorder(str: String) {
    let root = tree[str]!
    print(str, terminator: "")
    if root.left != "." {
        preorder(str: root.left)
    }
    if root.right != "." {
        preorder(str: root.right)
    }
}

func inorder(str: String) {
    let root = tree[str]!
    if root.left != "." {
        inorder(str: root.left)
    }
    print(str, terminator: "")
    if root.right != "." {
        inorder(str: root.right)
    }
}

func postorder(str: String) {
    let root = tree[str]!
    if root.left != "." {
        postorder(str: root.left)
    }
    if root.right != "." {
        postorder(str: root.right)
    }
    print(str, terminator: "")
}
