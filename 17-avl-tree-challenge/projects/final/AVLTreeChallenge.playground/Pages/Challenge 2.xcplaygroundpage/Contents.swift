// Copyright (c) 2019 Razeware LLC
// For full license & permission details, see LICENSE.markdown.
/*:
 [Previous Challenge](@previous)
 
 ## Challenge 2
 
 How many **nodes** are there in a perfectly balanced tree of height 3? What about a perfectly balanced tree of height `h`?
*/

import Foundation



//func nodes(inTreeOfHeight height: Int) -> Int {
//  var totalHeight = 0
//  for currentHeight in 0...height {
//    totalHeight += Int(pow(2.0, Double(currentHeight)))
//  }
//  return totalHeight
//}

func nodes(inTreeOfHeight height: Int) -> Int {
  Int(pow(2, Double(height + 1))) - 1
}

nodes(inTreeOfHeight: 3)

//: [Next Challenge](@next)
