// Copyright (c) 2019 Razeware LLC
// For full license & permission details, see LICENSE.markdown.
/*:
 # 1. Count the Number of Paths
 
 Write a method to count the number of paths between two vertices in a directed graph.
 */


extension Graph where Element: Hashable {
    
  public func numberOfPaths(from source: Vertex<Element>, to destination: Vertex<Element>) -> Int {
    var numberOfPaths = 0
    var visited: Set<Vertex<Element>> = []
    paths(from: source, to: destination, visited: &visited, pathCount: &numberOfPaths)
    return numberOfPaths
  }
  
  func paths(from source: Vertex<Element>,
             to destination: Vertex<Element>,
             visited: inout Set<Vertex<Element>>,
             pathCount: inout Int) {
    visited.insert(source)
    if source == destination {
      pathCount += 1
    } else {
      let neighbors = edges(from: source)
      for edge in neighbors {
        if !visited.contains(edge.destination) {
          paths(from: edge.destination, to: destination, visited: &visited, pathCount: &pathCount)
        }
      }
    }
    // Remove the vertex from the visited list, so you can find other paths to that node.
    visited.remove(source)
  }
}

//: ![numberOfPaths](numberOfPaths.png)

let graph = AdjacencyList<String>()

let a = graph.createVertex(data: "A")
let b = graph.createVertex(data: "B")
let c = graph.createVertex(data: "C")
let d = graph.createVertex(data: "D")
let e = graph.createVertex(data: "E")

graph.add(.directed, from: a, to: b, weight: 0)
graph.add(.directed, from: a, to: d, weight: 0)
graph.add(.directed, from: a, to: e, weight: 0)
graph.add(.directed, from: a, to: c, weight: 0)
graph.add(.directed, from: b, to: d, weight: 0)
graph.add(.directed, from: b, to: c, weight: 0)
graph.add(.directed, from: d, to: e, weight: 0)
graph.add(.directed, from: c, to: e, weight: 0)

print(graph)
print("Number of paths: \(graph.numberOfPaths(from: a, to: e))")

//: [Next Challenge](@next)
