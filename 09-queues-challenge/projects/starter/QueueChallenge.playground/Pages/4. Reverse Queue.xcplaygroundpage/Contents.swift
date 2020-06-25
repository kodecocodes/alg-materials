// Copyright (c) 2018 Razeware LLC
// For full license & permission details, see LICENSE.markdown.
//: [Previous Challenge](@previous)
/*:
 ## 4. Reverse Queue
 
 Implement a method to reverse the contents of a queue.
 
 > Hint: The `Stack` data structure has been included in the **Sources** folder.
 */
extension QueueArray {
    
  func reversed() -> QueueArray {
     // replace the body of this method
    return self // return a copy of the reversed queue
  }
}

var queue = QueueArray<String>()
queue.enqueue("1")
queue.enqueue("21")
queue.enqueue("18")
queue.enqueue("42")

print("before: \(queue)")
print("after: \(queue.reversed())")

//: [Next Challenge](@next)
