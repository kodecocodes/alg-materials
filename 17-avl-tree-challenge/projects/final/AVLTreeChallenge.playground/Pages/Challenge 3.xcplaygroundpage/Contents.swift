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

protocol TraversableBinaryNode {
    
  associatedtype Element
  var value: Element { get }
  var leftChild: Self? { get }
  var rightChild: Self? { get }
  func traverseInOrder(visit: (Element) -> Void)
  func traversePreOrder(visit: (Element) -> Void)
  func traversePostOrder(visit: (Element) -> Void)
}

extension TraversableBinaryNode {
  
  func traverseInOrder(visit: (Element) -> Void) {
    leftChild?.traverseInOrder(visit: visit)
    visit(value)
    rightChild?.traverseInOrder(visit: visit)
  }
  
  func traversePreOrder(visit: (Element) -> Void) {
    visit(value)
    leftChild?.traversePreOrder(visit: visit)
    rightChild?.traversePreOrder(visit: visit)
  }
  
  func traversePostOrder(visit: (Element) -> Void) {
    leftChild?.traversePostOrder(visit: visit)
    rightChild?.traversePostOrder(visit: visit)
    visit(value)
  }
}

extension AVLNode: TraversableBinaryNode {}

example(of: "using TraversableBinaryNode") {
  var tree = AVLTree<Int>()
  for i in 0..<15 {
    tree.insert(i)
  }
  print(tree)
  tree.root?.traverseInOrder { print($0) }
}
