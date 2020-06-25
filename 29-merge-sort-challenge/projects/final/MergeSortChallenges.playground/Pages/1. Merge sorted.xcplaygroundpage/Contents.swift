// Copyright (c) 2019 Razeware LLC
// For full license & permission details, see LICENSE.markdown.
//:
//: # Merge Sort Challenges
//: ## Challenge 1: Speeding up appends

let size = 1024
var values: [Int] = []
values.reserveCapacity(size)
for i in 0 ..< size {
  values.append(i)
}

//: ## Challenge 2: Merge two sequences
func merge<T: Sequence>(first: T, second: T) -> AnySequence<T.Element> where T.Element: Comparable {
  var result: [T.Element] = []
  
  var firstIterator = first.makeIterator()
  var secondIterator = second.makeIterator()
  
  var firstNextValue = firstIterator.next()
  var secondNextValue = secondIterator.next()
  
  while let first = firstNextValue, let second = secondNextValue {
    
    if first < second {
      result.append(first)
      firstNextValue = firstIterator.next()
    } else if second < first {
      result.append(second)
      secondNextValue = secondIterator.next()
    } else {
      result.append(first)
      result.append(second)
      firstNextValue = firstIterator.next()
      secondNextValue = secondIterator.next()
    }
  }
  
  while let first = firstNextValue {
    result.append(first)
    firstNextValue = firstIterator.next()
  }
  
  while let second = secondNextValue {
    result.append(second)
    secondNextValue = secondIterator.next()
  }
  
  return AnySequence<T.Element>(result)
}

var array1 = [1, 2, 3, 4, 5, 6, 7, 8]
var array2 = [1, 3, 4, 5, 5, 6, 7, 7]

for element in merge(first: array1, second: array2) {
  print(element)
}
