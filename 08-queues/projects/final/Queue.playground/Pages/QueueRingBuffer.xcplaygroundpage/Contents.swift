// Copyright (c) 2019 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

public struct QueueRingBuffer<T>: Queue {
  
  private var ringBuffer: RingBuffer<T>
  
  public init(count: Int) {
    ringBuffer = RingBuffer<T>(count: count)
  }
  
  public var isEmpty: Bool {
    ringBuffer.isEmpty
  }
  
  public var peek: T? {
    ringBuffer.first
  }
  
  public mutating func enqueue(_ element: T) -> Bool {
    ringBuffer.write(element)
  }
  
  public mutating func dequeue() -> T? {
    ringBuffer.read()
  }
}

extension QueueRingBuffer: CustomStringConvertible {
  
  public var description: String {
    String(describing: ringBuffer)
  }
}

var queue = QueueRingBuffer<String>(count: 10)
queue.enqueue("Ray")
queue.enqueue("Brian")
queue.enqueue("Eric")
queue
queue.dequeue()
queue
queue.peek
