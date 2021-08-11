// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

public class QueueLinkedList<T>: Queue {
  
  private var list = DoublyLinkedList<T>()
  public init() {}

  public var peek: T? {
    list.first?.value
  }
  
  public var isEmpty: Bool {
    list.isEmpty
  }
  
  public func enqueue(_ element: T) -> Bool {
    list.append(element)
    return true
  }
  
  public func dequeue() -> T? {
    guard !list.isEmpty, let element = list.first else {
      return nil
    }
    return list.remove(element)
  }
}

extension QueueLinkedList: CustomStringConvertible {

  public var description: String {
    String(describing: list)
  }
}

var queue = QueueLinkedList<String>()
queue.enqueue("Ray")
queue.enqueue("Brian")
queue.enqueue("Eric")
queue
queue.dequeue()
queue
queue.peek
