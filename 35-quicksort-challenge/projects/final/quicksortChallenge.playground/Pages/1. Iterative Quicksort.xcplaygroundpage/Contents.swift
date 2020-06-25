// Copyright (c) 2019 Razeware LLC
// For full license & permission details, see LICENSE.markdown.
/*:
 # Quicksort Challenges
 ## 1. Iterative Quicksort
 
 Implement Quicksort iteratively. Choose any partition strategy you learned in this chapter.
 */
public func quicksortIterativeLomuto<T: Comparable>(_ a: inout [T], low: Int, high: Int) {
  var stack = Stack<Int>()
  stack.push(low)
  stack.push(high)
  
  while !stack.isEmpty {
    guard let end = stack.pop(),
        let start = stack.pop() else {
      continue
    }
    
    let p = partitionLomuto(&a, low: start, high: end)
    
    if (p - 1) > start {
      stack.push(start)
      stack.push(p - 1)
    }
    
    if (p + 1) < end {
      stack.push(p + 1)
      stack.push(end)
    }
  }
}

var list = [12, 0, 3, 9, 2, 21, 18, 27, 1, 5, 8, -1, 8]
quicksortIterativeLomuto(&list, low: 0, high: list.count - 1)
print(list)
//: [Next Challenge](@next)
