// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

public func bubbleSort<Element>(_ array: inout [Element]) where Element: Comparable {
  guard array.count >= 2 else {
    return
  }
  for end in (1..<array.count).reversed() {
    var swapped = false
    for current in 0..<end {
      if array[current] > array[current + 1] {
        array.swapAt(current, current + 1)
        swapped = true
      }
    }
    if !swapped {
      return
    }
  }
}

public func bubbleSort<CollectionType>(_ collection: inout CollectionType)
  where CollectionType: MutableCollection, CollectionType.Element: Comparable {
    guard collection.count >= 2 else {
      return
    }
    for end in collection.indices.reversed() {
      var swapped = false
      var current = collection.startIndex
      while current < end {
        let next = collection.index(after: current)
        if collection[current] > collection[next] {
          collection.swapAt(current, next)
          swapped = true
        }
        current = next
      }
      if !swapped {
        return
      }
    }
}
