// Copyright (c) 2019 Razeware LLC
// For full license & permission details, see LICENSE.markdown.
//: [Previous Challenge](@previous)
/*:
 ## 2. Merge Sort or Quicksort
 
 Explain when and why you would use merge sort over quicksort.
 */

/*

 - Merge sort is preferable over quick sort when you need stability. Merge sort
   is a stable sort and guarantees _O_(_n_ log _n_). This is not the case with
   quick sort, which isn’t stable and can perform as bad as _O_(_n²_).
 
 - Merge sort works better for larger data structures or data structures where
   elements are scattered throughout memory. Quick sort works best when elements
   are stored in a contiguous block.
 
 */

//: [Next Challenge](@next)
