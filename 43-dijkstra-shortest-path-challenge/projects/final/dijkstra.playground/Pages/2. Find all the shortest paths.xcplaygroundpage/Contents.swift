// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.markdown.
//:
/*:
 [Previous Challenge](@previous)
 ## 2. Find all the shortest paths
 
 Add a method to class `Dijkstra` that returns a dictionary of all the
 shortest paths to all vertices given a starting vertex.
 */


//: ![challenge1Diagram](challenge1Question.png)

let graph = AdjacencyList<String>()

let a = graph.createVertex(data: "A")
let b = graph.createVertex(data: "B")
let c = graph.createVertex(data: "C")
let d = graph.createVertex(data: "D")
let e = graph.createVertex(data: "E")

graph.add(.directed, from: a, to: b, weight: 1)
graph.add(.directed, from: a, to: e, weight: 21)
graph.add(.directed, from: a, to: c, weight: 12)
graph.add(.directed, from: b, to: d, weight: 9)
graph.add(.directed, from: b, to: c, weight: 8)
graph.add(.directed, from: d, to: e, weight: 2)
graph.add(.directed, from: c, to: e, weight: 2)

print(graph)

let dijkstra = Dijkstra(graph: graph)
let pathsDict = dijkstra.getAllShortestPath(from: a)

for (vertex, path) in pathsDict {
  print("Path to \(vertex) from \(a)")
  for edge in path {
    print("\(edge.source) --|\(edge.weight ?? 0.0)|--> \(edge.destination)")
  }
  print("\n")
}



