// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.markdown.
/*:
 [Previous Challenge](@previous)
 ## 3. Disconnected Graph
 Add a method to `Graph` to detect if a graph is disconnected.
 
 To help you solve this challenge, a property `allVertices` was added
 to the `Graph` protocol:
 
 ```swift
 var allVertices: [Vertex<Element>] { get }
 ```
 
 This property is already implemented by `AdjacencyMatrix` and `AdjacencyList`.
 */

extension Graph where Element: Hashable {
  
  func breadthFirstSearch(from source: Vertex<Element>) -> [Vertex<Element>] {
    var queue = QueueStack<Vertex<Element>>()
    var enqueued: Set<Vertex<Element>> = []
    var visited: [Vertex<Element>] = []
    
    queue.enqueue(source)
    enqueued.insert(source)
    
    while let vertex = queue.dequeue() {
      visited.append(vertex)
      let neighborEdges = edges(from: vertex)
      neighborEdges.forEach { edge in
        if !enqueued.contains(edge.destination) {
          queue.enqueue(edge.destination)
          enqueued.insert(edge.destination)
        }
      }
    }
    
    return visited
  }
}

extension Graph where Element: Hashable {
    
  func isDisconnected() -> Bool {
    guard let firstVertex = allVertices.first else {
      return false
    }
    let visited = breadthFirstSearch(from: firstVertex)
    for vertex in allVertices {
      if !visited.contains(vertex) {
        return true
      }
    }
    return false
  }
}


//: ![challenge3Sample](challenge3Sample.png)

let graph = AdjacencyList<String>()
let a = graph.createVertex(data: "A")
let b = graph.createVertex(data: "B")
let c = graph.createVertex(data: "C")
let d = graph.createVertex(data: "D")
let e = graph.createVertex(data: "E")
let f = graph.createVertex(data: "F")
let g = graph.createVertex(data: "G")
let h = graph.createVertex(data: "H")

graph.add(.undirected, from: a, to: b, weight: nil)
graph.add(.undirected, from: a, to: c, weight: nil)
graph.add(.undirected, from: a, to: d, weight: nil)
graph.add(.undirected, from: e, to: h, weight: nil)
graph.add(.undirected, from: e, to: f, weight: nil)
graph.add(.undirected, from: f, to: g, weight: nil)

graph.isDisconnected()


// Add the following connection to connect the graphs
graph.add(.undirected, from: a, to: e, weight: nil)
graph.isDisconnected()
