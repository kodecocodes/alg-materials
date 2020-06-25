// Copyright (c) 2019 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

public struct Edge<T> {
  
  public let source: Vertex<T>
  public let destination: Vertex<T>
  public let weight: Double?
}
