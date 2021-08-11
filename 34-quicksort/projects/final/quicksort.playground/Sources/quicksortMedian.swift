// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

import Foundation

public func medianOfThree<T: Comparable>(_ a: inout [T], low: Int, high: Int) -> Int {
  let center = (low + high) / 2
  if a[low] > a[center] {
    a.swapAt(low, center)
  }
  if a[low] > a[high] {
    a.swapAt(low, high)
  }
  if a[center] > a[high] {
    a.swapAt(center, high)
  }
  return center
}

public func quickSortMedian<T: Comparable>(_ a: inout [T], low: Int, high: Int) {
  if low < high {
    let pivotIndex = medianOfThree(&a, low: low, high: high)
    a.swapAt(pivotIndex, high)
    let pivot = partitionLomuto(&a, low: low, high: high)
    quicksortLomuto(&a, low: low, high: pivot - 1)
    quicksortLomuto(&a, low: pivot + 1, high: high)
  }
}
