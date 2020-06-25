
// Copyright (c) 2019 Razeware LLC
// For full license & permission details, see LICENSE.markdown.
/*:
 # Priority Queue Challenges
 ## 1. Array-based Priority Queue
 You know how to use a heap to construct a priority queue by conforming
 to the `Queue` protocol. Now construct a priority queue using an `Array`.
 */

public protocol Queue {
  associatedtype Element
  mutating func enqueue(_ element: Element) -> Bool
  mutating func dequeue() -> Element?
  var isEmpty: Bool { get }
  var peek: Element? { get }
}

public struct PriorityQueueArray<T: Equatable>: Queue {
  
  private var elements: [T] = []
  let sort: (Element, Element) -> Bool
  
  public init(sort: @escaping (Element, Element) -> Bool, elements: [Element] = []) {
    self.sort = sort
    self.elements = elements
    self.elements.sort(by: sort)
  }
  
  public var isEmpty: Bool {
    elements.isEmpty
  }
  
  public var peek: T? {
    elements.first
  }
  
  public mutating func enqueue(_ element: T) -> Bool {
    for (index, otherElement) in elements.enumerated() {
      if sort(element, otherElement) {
        elements.insert(element, at: index)
        return true
      }
    }
    elements.append(element)
    return true
  }
  
  public mutating func dequeue() -> T? {
    isEmpty ? nil : elements.removeFirst()
  }
}

extension PriorityQueueArray: CustomStringConvertible {

  public var description: String {
    String(describing: elements)
  }
}

var priorityQueue = PriorityQueueArray(sort: >, elements: [1,12,3,4,1,6,8,7])
priorityQueue.enqueue(5)
priorityQueue.enqueue(0)
priorityQueue.enqueue(10)
while !priorityQueue.isEmpty {
  print(priorityQueue.dequeue()!)
}

//: [Next Challenge](@next)
