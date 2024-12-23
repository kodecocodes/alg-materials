// Copyright (c) 2025 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

public class Node<Value> {
  
  public var value: Value
  public var next: Node?
  
  public init(value: Value, next: Node? = nil) {
    self.value = value
    self.next = next
  }
}

extension Node: CustomStringConvertible {
  
  public var description: String {
    guard let next else {
      return "\(value)"
    }
    return "\(value) -> " + String(describing: next) + " "
  }
}
