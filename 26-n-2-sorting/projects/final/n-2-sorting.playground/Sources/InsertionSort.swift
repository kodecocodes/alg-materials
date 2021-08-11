// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

public func insertionSort<Element>(_ array: inout [Element]) where Element: Comparable {
  guard array.count >= 2 else {
    return
  }
  for current in 1..<array.count {
    for shifting in (1...current).reversed() {
      if array[shifting] < array[shifting - 1] {
        array.swapAt(shifting, shifting - 1)
      } else {
        break
      }
    }
  }
}

public func insertionSort<CollectionType>(_ collection: inout CollectionType)
  where CollectionType: BidirectionalCollection & MutableCollection, CollectionType.Element: Comparable {
    guard collection.count >= 2 else {
      return
    }
    for current in collection.indices {
      var shifting = current
      while shifting > collection.startIndex {
        let previous = collection.index(before: shifting)
        if collection[shifting] < collection[previous] {
          collection.swapAt(shifting, previous)
        } else {
          break
        }
        shifting = previous
      }
    }
}
