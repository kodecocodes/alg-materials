// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

/*:
 # Heap Sort Challenges
 ## 1. Add Heap Sort to `Array`

 Add a `heapSort()` method to Array. This method should sort the array
 in ascending order.
 
 */

extension Array where Element: Comparable {
  
  func leftChildIndex(ofParentAt index: Int) -> Int {
    (2 * index) + 1
  }
  
  func rightChildIndex(ofParentAt index: Int) -> Int {
    (2 * index) + 2
  }
  
  mutating func siftDown(from index: Int, upTo size: Int) {
    var parent = index
    while true {
      let left = leftChildIndex(ofParentAt: parent)
      let right = rightChildIndex(ofParentAt: parent)
      var candidate = parent
      
      if (left < size) && (self[left] > self[candidate]) {
        candidate = left
      }
      if (right < size) && (self[right] > self[candidate]) {
        candidate = right
      }
      if candidate == parent {
        return
      }
      swapAt(parent, candidate)
      parent = candidate
    }
  }
  
  mutating func heapSort() {
    // do something
  }
}

var array = [6, 12, 2, 26, 8, 18, 21, 9, 5]
array.heapSort()

/*:
 ## 2. Theory
 When performing a heap sort in ascending order, which of these starting
 arrays requires the fewest comparisons?
 - `[1,2,3,4,5]`
 - `[5,4,3,2,1]`
*/

/*:
 ## 3. Descending Order
 The chapter implementation of heap sort, sorts the elements in ascending order.
 How would you sort in descending order?
 */

