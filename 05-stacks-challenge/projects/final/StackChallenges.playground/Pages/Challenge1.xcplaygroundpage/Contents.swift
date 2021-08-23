// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.markdown.
/*:
 # Stack Challenges
 
 ## #1. Reserve an Array
 
 Create a function that prints the contents of an array in reversed order.
 */
let array: [Int] = [1, 2, 3, 4, 5]

func printInReverse<T>(_ array: [T]) {
  var stack = Stack<T>()

  for value in array {
    stack.push(value)
  }

  while let value = stack.pop() {
    print(value)
  }
}

printInReverse(array)
//: [Next Challenge](@next)
