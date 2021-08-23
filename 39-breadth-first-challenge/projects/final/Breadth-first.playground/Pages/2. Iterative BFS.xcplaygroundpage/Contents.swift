// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.markdown.
/*:
 [Previous Challenge](@previous)
 
 ## 2. Iterative BFS
 
 In this chapter we went over an iterative implementation of breadth-first
 search. Now write a recursive implementation.
 */

extension Graph where Element: Hashable {
    
  func bfs(from source: Vertex<Element>) -> [Vertex<Element>] {
    var queue = QueueStack<Vertex<Element>>()
    var enqueued: Set<Vertex<Element>> = []
    var visited: [Vertex<Element>] = []
    
    queue.enqueue(source)
    enqueued.insert(source)
    
    bfs(queue: &queue, enqueued: &enqueued, visited: &visited)
    return visited
  }
  
  private func bfs(queue: inout QueueStack<Vertex<Element>>,
                   enqueued: inout Set<Vertex<Element>>,
                   visited: inout [Vertex<Element>]) {
    guard let vertex = queue.dequeue() else {
      return
    }
    visited.append(vertex)
    let neighborEdges = edges(from: vertex)
    neighborEdges.forEach { edge in
      if !enqueued.contains(edge.destination) {
        queue.enqueue(edge.destination)
        enqueued.insert(edge.destination)
      }
    }
    bfs(queue: &queue, enqueued: &enqueued, visited: &visited)
  }
}


//: ![sampleGraph](sampleGraph.png)

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
graph.add(.undirected, from: b, to: e, weight: nil)
graph.add(.undirected, from: c, to: f, weight: nil)
graph.add(.undirected, from: c, to: g, weight: nil)
graph.add(.undirected, from: e, to: h, weight: nil)
graph.add(.undirected, from: e, to: f, weight: nil)
graph.add(.undirected, from: f, to: g, weight: nil)

print(graph)

let vertices = graph.bfs(from: a)
vertices.forEach { vertex in
  print(vertex)
}

//: [Next Challenge](@next)
