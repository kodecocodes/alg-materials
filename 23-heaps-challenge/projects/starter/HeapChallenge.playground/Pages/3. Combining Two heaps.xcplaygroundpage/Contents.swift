// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.markdown.
/*:
 [Previous Challenge](@previous)
 
 ## 2. Step-by-Step Diagram
 
 See solutions chapter.
 
 ## 3. Combining Two Heaps

 Write a method that combines two heaps together.
 
 Following function added in **Heap.swift**.
 ```
 mutating public func merge(heap: Heap) {
   // Your solution here 
 }
 ```
 */

let elements = [21, 10, 18, 5, 3, 100, 1]
let elements2 = [8, 6, 20, 15, 12, 11]
var heap = Heap(sort: <, elements: elements)
var heap2 = Heap(sort: <, elements: elements2)

heap.merge(heap: heap2)
print(heap)

//: [Next Challenge](@next)
