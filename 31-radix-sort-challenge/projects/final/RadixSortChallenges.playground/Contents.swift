// Copyright (c) 2019 Razeware LLC
// For full license & permission details, see LICENSE.markdown.
//: # Radix Sort Challenges
//: ## Challenge 1: Most significant digit
//:
//: The implementation discussed in the chapter used a *least significant digit*
//: radix sort. Your task is to implement a *most significant digit* radix sort.
//: This sorting behavior is called **lexicographical sorting** and is also used
//: for `String` sorting.
//:
//:  For example:
//:
//: ```swift
//: var array = [500, 1345, 13, 459, 44, 999]
//: array.lexicographicalSort()
//: print(array) // outputs [13, 1345, 44, 459, 500, 999]
//: ```

import Foundation

extension Int {
  
  var digits: Int {
    var count = 0
    var num = self
    while num != 0 {
      count += 1
      num /= 10
    }
    return count
  }
  
  func digit(atPosition position: Int) -> Int? {
    guard position < digits else {
      return nil
    }
    var num = self
    let correctedPosition = Double(position + 1)
    while num / Int(pow(10.0, correctedPosition)) != 0 {
      num /= 10
    }
    return num % 10
  }
}


extension Array where Element == Int {
  
  private var maxDigits: Int {
    self.max()?.digits ?? 0
  }
  
  mutating func lexicographicalSort() {
    self = msdRadixSorted(self, 0)
  }
  
  private func msdRadixSorted(_ array: [Int], _ position: Int) -> [Int] {
    guard position < array.maxDigits else {
      return array
    }
    
    var buckets: [[Int]] = .init(repeating: [], count: 10)
    var priorityBucket: [Int] = []
    
    array.forEach { number in
      guard let digit = number.digit(atPosition: position) else {
        priorityBucket.append(number)
        return
      }
      buckets[digit].append(number)
    }
    
    priorityBucket.append(contentsOf: buckets.reduce(into: []) {
      result, bucket in
      guard !bucket.isEmpty else {
        return
      }
      result.append(contentsOf: msdRadixSorted(bucket, position + 1))
    })
    return priorityBucket
  }
}

var array = [500, 1345, 13, 459, 44, 999]
array.lexicographicalSort()
print(array) // outputs [13, 1345, 44, 459, 500, 999]

var array2: [Int] = (0...10).map { _ in Int.random(in: 1...100000) }
array2.lexicographicalSort()
print(array2)
