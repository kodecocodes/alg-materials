// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

/*:
 [Previous Challenge](@previous)
 ### Challenge 2: Searching for a range
 Write a function that searches a **sorted** array and that finds the range of indices for a particular element. For example:

```swift
let array = [1, 2, 3, 3, 3, 4, 5, 5]
findIndices(of: 3, in: array)
```

`findIndices` should return the range `2..<5`, since those are the start and end indices for the value `3`.
*/

/*:
 Unoptimized version

```
func findIndices(of value: Int, in array: [Int]) -> Range<Int>? {
  guard let leftIndex = array.firstIndex(of: value) else {
    return nil
  }
  guard let rightIndex = array.lastIndex(of: value) else {
    return nil
  }
  return leftIndex..<rightIndex
}
```
 */

func findIndices(of value: Int, in array: [Int]) -> CountableRange<Int>? {
  guard let startIndex = startIndex(of: value, in: array, range: 0..<array.count) else {
    return nil
  }
  guard let endIndex = endIndex(of: value, in: array, range: 0..<array.count) else {
    return nil
  }
  return startIndex..<endIndex
}

func startIndex(of value: Int, in array: [Int], range: CountableRange<Int>) -> Int? {
  let middleIndex = range.lowerBound + (range.upperBound - range.lowerBound) / 2
  if middleIndex == 0 || middleIndex == array.count - 1 {
    if array[middleIndex] == value {
      return middleIndex
    } else {
      return nil
    }
  }
  
  if array[middleIndex] == value {
    if array[middleIndex - 1] != value {
      return middleIndex
    } else {
      return startIndex(of: value, in: array, range: range.lowerBound..<middleIndex)
    }
  } else if value < array[middleIndex]  {
    return startIndex(of: value, in: array, range: range.lowerBound..<middleIndex)
  } else {
    return startIndex(of: value, in: array, range: middleIndex..<range.upperBound)
  }
}

func endIndex(of value: Int, in array: [Int], range: CountableRange<Int>) -> Int? {
  let middleIndex = range.lowerBound + (range.upperBound - range.lowerBound) / 2
  
  if middleIndex == 0 || middleIndex == array.count - 1 {
    if array[middleIndex] == value {
      return middleIndex + 1
    } else {
      return nil
    }
  }
  
  if array[middleIndex] == value {
    if array[middleIndex + 1] != value {
      return middleIndex + 1
    } else {
      return endIndex(of: value, in: array, range: middleIndex..<range.upperBound)
    }
  } else if value < array[middleIndex]  {
    return endIndex(of: value, in: array, range: range.lowerBound..<middleIndex)
  } else {
    return endIndex(of: value, in: array, range: middleIndex..<range.upperBound)
  }
}

let array = [1, 2, 3, 3, 3, 4, 5, 5]
if let indices = findIndices(of: 3, in: array) {
  print(indices)
}

