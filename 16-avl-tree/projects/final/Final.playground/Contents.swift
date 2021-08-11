// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

example(of: "repeated insertions in sequence") {
  var tree = AVLTree<Int>()
  for i in 0..<15 {
    tree.insert(i)
  }
  print(tree)
}

example(of: "removing a value") {
  var tree = AVLTree<Int>()
  tree.insert(15)
  tree.insert(10)
  tree.insert(16)
  tree.insert(18)
  print(tree)
  tree.remove(10)
  print(tree)
}
