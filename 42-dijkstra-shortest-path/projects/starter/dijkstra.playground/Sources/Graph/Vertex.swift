// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

public struct Vertex<T> {
  
  public let index: Int
  public let data: T
}

extension Vertex: Hashable where T: Hashable {}
extension Vertex: Equatable where T: Equatable {}

extension Vertex: CustomStringConvertible {
  public var description: String {
    "\(data)"
  }
}
