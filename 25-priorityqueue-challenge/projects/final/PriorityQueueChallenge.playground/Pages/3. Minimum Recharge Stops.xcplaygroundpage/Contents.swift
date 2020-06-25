/*:
 [Previous Challenge](@previous)
 ## 3. Minimum Recharge Stops
 
 Swift-la is a new electric car company that is looking to add a new feature into their vehicles. They want to add the ability for their customers to check if the car can reach a given destination.  Since the journey to the destination may be far, there are charging stations that the car can recharge at. The company wants to find the **minimum number of charging stops** needed for the vehicle to reach its destination.

 You're given the following information:

 - The `target` distance the vehicle needs to travel.
 - The `startCharge`, how much charge the car has to begin the journey.
 - An ordered list of `stations` that the car can potentially stop at to charge along the way.

 Each `ChargingStation` has a `distance` from the start location and a `chargeCapacity`. This is the amount of charge a station can add to the car.

 You may assume the following:

 1. An electric car has an **infinite** charge capacity.
 2. One charge capacity is equivalent to one mile.
 3. The list of `stations` is sorted by distance from the start location:

 ```swift
 stations[0].distance < stations[1].distance < stations[k].distance
 ```
 */

struct ChargingStation {
  /// Distance from start location.
  let distance: Int
  /// The amount of electricity the station has to charge a car.
  /// 1 capacity = 1 mile
  let chargeCapacity: Int
}

enum DestinationResult {
  /// Able to reach your destination with the minimum number of stops.
  case reachable(rechargeStops: Int)
  /// Unable to reach your destination.
  case unreachable
}

/// Returns the minimum number of charging stations an electric vehicle needs to reach it's destination.
/// - Parameter target: the distance in miles the vehicle needs to travel.
/// - Parameter startCharge: the starting charge you have to start the journey.
/// - Parameter stations: the charging stations along the way.
func minRechargeStops(target: Int, startCharge: Int, stations: [ChargingStation]) -> DestinationResult {
  guard startCharge <= target else { return .reachable(rechargeStops: 0) }
  
  // Keeps track of the minimum number of stops needed to reach destination
  var minStops = -1
  // Keeps track of the vehicle's current charge on the journey.
  var currentCharge = 0
  // Tracks the number of stations passed.
  var currentStation = 0
  // Keeps track of all the station's charge capacity.
  // Responsibility for provide us the station with the highest charging capacity.
  // Initialize the priority queue with the vehicle's starting charge capacity.
  // The priority queue represents all the charging stations that is reachable.
  var chargePriority = PriorityQueue(sort: >, elements: [startCharge])
  
  while !chargePriority.isEmpty {
    guard let charge = chargePriority.dequeue() else {
      return .unreachable
    }
    currentCharge += charge
    minStops += 1
    
    if currentCharge >= target {
      return .reachable(rechargeStops: minStops)
    }
    
    while currentStation < stations.count &&
          currentCharge >= stations[currentStation].distance {
      let distance = stations[currentStation].chargeCapacity
      _ = chargePriority.enqueue(distance)
      currentStation += 1
    }
  }
  return .unreachable
}


// Sample Tests
let stations = [ChargingStation(distance: 10, chargeCapacity: 60),
                ChargingStation(distance: 20, chargeCapacity: 30),
                ChargingStation(distance: 30, chargeCapacity: 30),
                ChargingStation(distance: 60, chargeCapacity: 40)]

minRechargeStops(target: 100, startCharge: 10, stations: stations)
