// Copyright (c) 2019 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

public class TreeNode<T> {
  
  public var value: T
  public var children: [TreeNode] = []
  
  public init(_ value: T) {
    self.value = value
  }
  
  public func add(_ child: TreeNode) {
    children.append(child)
  }
}

extension TreeNode {
  public func forEachDepthFirst(visit: (TreeNode) -> Void) {
    visit(self)
    children.forEach {
      $0.forEachDepthFirst(visit: visit)
    }
  }
}

extension TreeNode {
  public func forEachLevelOrder(visit: (TreeNode) -> Void) {
    visit(self)
    var queue = Queue<TreeNode>()
    children.forEach { queue.enqueue($0) }
    while let node = queue.dequeue() {
      visit(node)
      node.children.forEach { queue.enqueue($0) }
    }
  }
}

extension TreeNode where T: Equatable {
  public func search(_ value: T) -> TreeNode? {
    var result: TreeNode?
    forEachDepthFirst { node in
      if node.value == value {
        result = node
      }
    }
    return result
  }
}
