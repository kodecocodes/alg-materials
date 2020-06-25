// Copyright (c) 2019 Razeware LLC
// For full license & permission details, see LICENSE.markdown.
/*:
 # Heap Data Structure Challenges
 ## 1. Find the nth Smallest Integer
 Write a function to find the `nth` smallest integer in an unsorted array. For example:
 ```
  let integers = [3, 10, 18, 5, 21, 100]
  n = 3
 ```
 If  `n = 3`, the result should be `10`.
 */

func getNthSmallestElement(n: Int, elements: [Int]) -> Int? {
  var heap = Heap(sort: <, elements: elements)
  var current = 1
  while !heap.isEmpty {
    let element = heap.remove()
    if current == n {
      return element
    }
    current += 1
  }
  
  return nil
}

let elements = [3, 10, 18, 5, 21, 100]
let nthElement = getNthSmallestElement(n: 3, elements: elements)

//: [Next Challenge](@next)
