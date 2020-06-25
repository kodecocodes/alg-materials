// Copyright (c) 2019 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

public struct QueueStack<T> : Queue {
  
  private var leftStack: [T] = []
  private var rightStack: [T] = []
  public init() {}
  
  public var isEmpty: Bool {
    leftStack.isEmpty && rightStack.isEmpty
  }
  
  public var peek: T? {
    !leftStack.isEmpty ? leftStack.last : rightStack.first
  }
  
  public mutating func enqueue(_ element: T) -> Bool {
    rightStack.append(element)
    return true
  }
  
  public mutating func dequeue() -> T? {
    if leftStack.isEmpty {
      leftStack = rightStack.reversed()
      rightStack.removeAll()
    }
    return leftStack.popLast()
  }
}

extension QueueStack: CustomStringConvertible {
  
  public var description: String {
    String(describing: leftStack.reversed() + rightStack)
  }
}

var queue = QueueStack<String>()
queue.enqueue("Ray")
queue.enqueue("Brian")
queue.enqueue("Eric")
queue
queue.dequeue()
queue
queue.peek
