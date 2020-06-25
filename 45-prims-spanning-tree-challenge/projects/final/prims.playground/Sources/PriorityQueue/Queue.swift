// Copyright (c) 2019 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

public protocol Queue {
  associatedtype Element
  mutating func enqueue(_ element: Element) -> Bool
  mutating func dequeue() -> Element?
  var isEmpty: Bool { get }
  var peek: Element? { get }
}
