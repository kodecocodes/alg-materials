// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

var graph = AdjacencyList<Int>()
let one = graph.createVertex(data: 1)
let two = graph.createVertex(data: 2)
let three = graph.createVertex(data: 3)
let four = graph.createVertex(data: 4)
let five = graph.createVertex(data: 5)
let six = graph.createVertex(data: 6)

graph.add(.undirected, from: one, to: two, weight: 6)
graph.add(.undirected, from: one, to: three, weight: 1)
graph.add(.undirected, from: one, to: four, weight: 5)
graph.add(.undirected, from: two, to: three, weight: 5)
graph.add(.undirected, from: two, to: five, weight: 3)
graph.add(.undirected, from: three, to: four, weight: 5)
graph.add(.undirected, from: three, to: five, weight: 6)
graph.add(.undirected, from: three, to: six, weight: 4)
graph.add(.undirected, from: four, to: six, weight: 2)
graph.add(.undirected, from: five, to: six, weight: 6)

let (cost,mst) = Prim().produceMinimumSpanningTree(for: graph)
print("cost: \(cost)")
print("mst:")
print(mst)

