// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.markdown.
/*:
 [Previous Challenge](@previous)
 ## 4. A Min Heap?
 Write a function to check if a given array is a min heap.
 */

func leftChildIndex(ofParentAt index: Int) -> Int {
  (2 * index) + 1
}

func rightChildIndex(ofParentAt index: Int) -> Int {
  (2 * index) + 2
}

func isMinHeap<Element: Comparable> (elements: [Element]) -> Bool {
  guard !elements.isEmpty else {
    return true
  }
  
  for i in stride(from: elements.count / 2 - 1, through: 0, by: -1) {
    let left = leftChildIndex(ofParentAt: i)
    let right = rightChildIndex(ofParentAt: i)
    if elements[left] < elements[i] {
      return false
    }
    
    if right < elements.count && elements[right] < elements[i]  {
      return false
    }
  }
  
  return true
}

let elements = [1, 3, 12, 5, 10, 18, 21, 6, 8, 11, 15, 100, 20]
isMinHeap(elements: elements)

