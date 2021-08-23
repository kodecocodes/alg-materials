// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

public class AdjacencyList<T: Hashable>: Graph {
  
  private var adjacencies: [Vertex<T>: [Edge<T>]] = [:]
  
  public init() {}
  
  public var vertices: [Vertex<T>] {
    Array(adjacencies.keys)
  }
  
  @discardableResult public func createVertex(data: T) -> Vertex<T> {
    let vertex = Vertex(index: adjacencies.count, data: data)
    adjacencies[vertex] = []
    return vertex
  }
  
  public func addDirectedEdge(from source: Vertex<T>, to destination: Vertex<T>, weight: Double?) {
    let edge = Edge(source: source, destination: destination, weight: weight)
    adjacencies[source]?.append(edge)
  }
  
  public func edges(from source: Vertex<T>) -> [Edge<T>] {
    adjacencies[source] ?? []
  }
  
  public func weight(from source: Vertex<T>, to destination: Vertex<T>) -> Double? {
    edges(from: source).first { $0.destination == destination }?.weight
  }
}

extension AdjacencyList: CustomStringConvertible {
  
  public var description: String {
    var result = ""
    for (vertex, edges) in adjacencies {
      var edgeString = ""
      for (index, edge) in edges.enumerated() {
        if index != edges.count - 1 {
          edgeString.append("\(edge.destination), ")
        } else {
          edgeString.append("\(edge.destination)")
        }
      }
      result.append("\(vertex) ---> [ \(edgeString) ]\n")
    }
    return result
  }
}
