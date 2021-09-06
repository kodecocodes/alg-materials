// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.markdown.
/*:
 [Previous Challenge](@previous)
 ## Challenge 4: Merge two lists

 Create a function that takes two sorted linked lists and merges them into a single sorted linked list. Your goal is to return a new linked list that contains the nodes from two lists in sorted order. You may assume the sort order is ascending.
 */
func mergeSorted<T: Comparable>(_ left: LinkedList<T>,
                                _ right: LinkedList<T>) -> LinkedList<T> {
  guard !left.isEmpty else {
    return right
  }
  
  guard !right.isEmpty else {
    return left
  }
  
  var newHead: Node<T>?
  var tail: Node<T>?
  
  var currentLeft = left.head
  var currentRight = right.head
  
  if let leftNode = currentLeft, let rightNode = currentRight {
    if leftNode.value < rightNode.value {
      newHead = leftNode
      currentLeft = leftNode.next
    } else {
      newHead = rightNode
      currentRight = rightNode.next
    }
    tail = newHead
  }
  
  while let leftNode = currentLeft, let rightNode = currentRight {
    if leftNode.value < rightNode.value {
      tail?.next = leftNode
      currentLeft = leftNode.next
    } else {
      tail?.next = rightNode
      currentRight = rightNode.next
    }
    tail = tail?.next
  }
  
  if let leftNodes = currentLeft {
    tail?.next = leftNodes
  }
  
  if let rightNodes = currentRight {
    tail?.next = rightNodes
  }
  
  var list = LinkedList<T>()
  list.head = newHead
  list.tail = {
    while let next = tail?.next {
      tail = next
    }
    return tail
  }()
  return list
}

example(of: "merging two lists") {
  var list = LinkedList<Int>()
  list.push(3)
  list.push(2)
  list.push(1)
  var anotherList = LinkedList<Int>()
  anotherList.push(-1)
  anotherList.push(-2)
  anotherList.push(-3)
  print("First list: \(list)")
  print("Second list: \(anotherList)")
  let mergedList = mergeSorted(list, anotherList)
  print("Merged list: \(mergedList)")
}

//: [Next Challenge](@next)
