// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.markdown.
/*:
 [Previous Challenge](@previous)
 ### #2. Equatable
 The binary search tree currently lacks `Equatable` conformance. Your challenge is to conform adopt the `Equatable` protocol.
 */
var bst = BinarySearchTree<Int>()
bst.insert(3)
bst.insert(1)
bst.insert(4)
bst.insert(0)
bst.insert(2)
bst.insert(5)

print(bst)

var bst2 = BinarySearchTree<Int>()
bst2.insert(2)
bst2.insert(5)
bst2.insert(3)
bst2.insert(1)
bst2.insert(0)
bst2.insert(4)

// Are bst1 and bst2 equal?
// Your solution here

//: [Next Challenge](@next)
