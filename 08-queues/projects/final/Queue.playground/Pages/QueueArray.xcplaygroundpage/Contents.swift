// Copyright (c) 2019 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

public struct QueueArray<T>: Queue {
  
  private var array: [T] = []
  public init() {}

  public var isEmpty: Bool {
    array.isEmpty
  }
  
  public var peek: T? {
    array.first
  }
  
  public mutating func enqueue(_ element: T) -> Bool {
    array.append(element)
    return true
  }
  
  public mutating func dequeue() -> T? {
    isEmpty ? nil : array.removeFirst()
  }
}

extension QueueArray: CustomStringConvertible {
  
  public var description: String {
    String(describing: array)
  }
}

var queue = QueueArray<String>()
queue.enqueue("Ray")
queue.enqueue("Brian")
queue.enqueue("Eric")
queue
queue.dequeue()
queue
queue.peek
