// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.markdown.
/*:
 [Previous Challenge](@previous)
 ## 2. Prioritize a Waitlist
 
 Your favorite T-Swift concert was sold out. Fortunately there is a waitlist for people who still want to go! However the ticket sales will first prioritize someone with a **military background**, followed by **seniority**. Write a `sort` function that will return the list of people on the waitlist by the priority mentioned.
 */

public struct Person: Equatable {
  let name: String
  let age: Int
  let isMilitary: Bool
}
