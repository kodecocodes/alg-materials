// Copyright (c) 2019 Razeware LLC
// For full license & permission details, see LICENSE.markdown.
//: # #1. Print a Tree in Level Order
//: 
//: Print all the values in a tree in an order based on their level.
//: Nodes in the same level should be printed on the same line.
//: For example, consider the following tree:
//:
//: ![Image of Tree](tree.png)
//:
//: Your algorithm should prinnt the following:
//:
//: ```none
//: 15
//: 1 17 20
//: 1 5 0 2 5 7
//: ```
//:
//: **Hint**: Consider using a `Queue` included for you in **Sources**.
// Build the sample tree shown in the diagram
// Root of the tree
let tree = TreeNode(15)

// Second level
let one = TreeNode(1)
tree.add(one)

let seventeen = TreeNode(17)
tree.add(seventeen)

let twenty = TreeNode(20)
tree.add(twenty)

// Third level
let one2 = TreeNode(1)
let five = TreeNode(5)
let zero = TreeNode(0)
one.add(one2)
one.add(five)
one.add(zero)

let two = TreeNode(2)
seventeen.add(two)

let five2 = TreeNode(5)
let seven = TreeNode(7)
twenty.add(five2)
twenty.add(seven)

// Solution

func printEachLevel<T>(for tree: TreeNode<T>) {
  var queue = Queue<TreeNode<T>>()
  var nodesLeftInCurrentLevel = 0
  
  queue.enqueue(tree)
  while !queue.isEmpty {
    nodesLeftInCurrentLevel = queue.count
    while nodesLeftInCurrentLevel > 0 {
      guard let node = queue.dequeue() else { break }
      print("\(node.value) ", terminator: "")
      node.children.forEach { queue.enqueue($0) }
      nodesLeftInCurrentLevel -= 1
    }
    print()
  }
}

printEachLevel(for: tree)
