// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.markdown.
/*:
 [Previous Challenge](@previous)
 
 ## Challenge 3
 
 Since there are many variants of binary trees, it makes sense to group shared
 functionality in a protocol. The traversal methods are a good candidate for
 this.
 
 Create a TraversableBinaryNode protocol that provides a default implementation
 of the traversal methods so that conforming types get these methods for free.
 Have AVLNode conform to this.
 */
// Your code here

// extension AVLNode: TraversableBinaryNode {}

example(of: "using TraversableBinaryNode") {
  var tree = AVLTree<Int>()
  for i in 0..<15 {
    tree.insert(i)
  }
  print(tree)
  // tree.root?.traverseInOrder { print($0) }
}
