// Copyright (c) 2019 Razeware LLC
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

func tswiftSort(person1: Person, person2: Person) -> Bool {
  if person1.isMilitary == person2.isMilitary {
    return person1.age > person2.age
  }
  
  return person1.isMilitary
}

let p = Person(name: "Josh", age: 21, isMilitary: true)
let p2 = Person(name: "Jake", age: 22, isMilitary: true)
let p3 = Person(name: "Clay", age: 28, isMilitary: false)
let p4 = Person(name: "Cindy", age: 28, isMilitary: false)
let p5 = Person(name: "Sabrina", age: 30, isMilitary: false)

let waitlist = [p, p2, p3, p4, p5]

var priorityQueue = PriorityQueue(sort: tswiftSort, elements: waitlist)
while !priorityQueue.isEmpty {
  print(priorityQueue.dequeue()!)
}

