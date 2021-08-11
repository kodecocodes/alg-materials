// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

public struct Queue<T> {
  
  private var leftStack: [T] = []
  private var rightStack: [T] = []
  
  public init() {}
  
  public var isEmpty: Bool {
    leftStack.isEmpty && rightStack.isEmpty
  }
  
  public var peek: T? {
    !leftStack.isEmpty ? leftStack.last : rightStack.first
  }
  
  @discardableResult public mutating func enqueue(_ element: T) -> Bool {
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
