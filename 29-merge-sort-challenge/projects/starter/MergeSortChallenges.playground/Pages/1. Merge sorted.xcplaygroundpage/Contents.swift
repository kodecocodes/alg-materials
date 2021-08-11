// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.markdown.
//:
//: # Merge Sort Challenges
//: ## Challenge 1: Speeding up appends

let size = 1024
var values: [Int] = []
// 1
for i in 0 ..< size {
  values.append(i)
}


//: ## Challenge 2: Merge two sequences
func merge<T: Sequence>(first: T, second: T) -> AnySequence<T.Element> where T.Element: Comparable {
  fatalError() // placeholder
}
